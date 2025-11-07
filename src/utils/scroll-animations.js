// Fade-in on scroll utility
// Adds smooth fade-in animation when elements enter viewport

export function initScrollAnimations() {
  // Check if IntersectionObserver is supported
  if (!('IntersectionObserver' in window)) {
    return;
  }

  // Observer options
  const observerOptions = {
    threshold: 0.1, // Trigger when 10% of element is visible
    rootMargin: '0px 0px -50px 0px' // Start animation slightly before element enters
  };

  // Callback when element intersects
  const observerCallback = (entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('fade-in-visible');
        // Optional: stop observing after animation (performance)
        // observer.unobserve(entry.target);
      }
    });
  };

  // Create observer
  const observer = new IntersectionObserver(observerCallback, observerOptions);

  // Observe all elements with data-fade-in attribute
  const elementsToAnimate = document.querySelectorAll('[data-fade-in]');
  
  elementsToAnimate.forEach((el, index) => {
    // Add stagger delay based on index
    const delay = parseInt(el.dataset.fadeIn) || index * 100;
    el.style.transitionDelay = `${delay}ms`;
    
    observer.observe(el);
  });
}

// Auto-initialize on DOM ready
if (typeof window !== 'undefined') {
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initScrollAnimations);
  } else {
    initScrollAnimations();
  }
}
