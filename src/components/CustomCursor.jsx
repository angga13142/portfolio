import { useEffect, useRef } from 'react';

export default function CustomCursor() {
  const cursorRef = useRef(null);
  const trailRef = useRef(null);

  useEffect(() => {
    // Check if user prefers reduced motion
    const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    if (prefersReducedMotion) return;

    // Check if mobile
    const isMobile = window.matchMedia('(max-width: 768px)').matches;
    if (isMobile) return;

    const cursor = cursorRef.current;
    const trail = trailRef.current;
    if (!cursor || !trail) return;

    let mouseX = 0;
    let mouseY = 0;
    let cursorX = 0;
    let cursorY = 0;
    let trailX = 0;
    let trailY = 0;

    const handleMouseMove = (e) => {
      mouseX = e.clientX;
      mouseY = e.clientY;
      cursor.classList.add('active');
    };

    const handleMouseEnter = (e) => {
      if (e.target.tagName === 'A' || e.target.tagName === 'BUTTON') {
        cursor.classList.add('hover');
      }
    };

    const handleMouseLeave = (e) => {
      if (e.target.tagName === 'A' || e.target.tagName === 'BUTTON') {
        cursor.classList.remove('hover');
      }
    };

    const animate = () => {
      // Smooth follow effect
      const speed = 0.15;
      
      cursorX += (mouseX - cursorX) * speed;
      cursorY += (mouseY - cursorY) * speed;
      
      trailX += (mouseX - trailX) * (speed * 0.5);
      trailY += (mouseY - trailY) * (speed * 0.5);

      cursor.style.left = `${cursorX}px`;
      cursor.style.top = `${cursorY}px`;
      
      trail.style.left = `${trailX}px`;
      trail.style.top = `${trailY}px`;

      requestAnimationFrame(animate);
    };

    document.addEventListener('mousemove', handleMouseMove);
    document.addEventListener('mouseover', handleMouseEnter);
    document.addEventListener('mouseout', handleMouseLeave);
    
    animate();

    return () => {
      document.removeEventListener('mousemove', handleMouseMove);
      document.removeEventListener('mouseover', handleMouseEnter);
      document.removeEventListener('mouseout', handleMouseLeave);
    };
  }, []);

  return (
    <>
      <div ref={cursorRef} className="custom-cursor" />
      <div ref={trailRef} className="cursor-trail" />
    </>
  );
}
