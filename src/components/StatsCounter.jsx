import { useEffect, useRef, useState } from 'react';

export default function StatsCounter() {
  const [isVisible, setIsVisible] = useState(false);
  const sectionRef = useRef(null);

  const stats = [
    { value: 2, suffix: '+', label: 'Years Experience', duration: 1000 },
    { value: 1121, suffix: '', label: 'Tests Passing', duration: 2000 },
    { value: 99.7, suffix: '%', label: 'Test Coverage', duration: 2000, decimals: 1 },
    { value: 95, suffix: '%', label: 'Lighthouse Score', duration: 1500 },
  ];

  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setIsVisible(true);
        }
      },
      { threshold: 0.3 }
    );

    if (sectionRef.current) {
      observer.observe(sectionRef.current);
    }

    return () => {
      if (sectionRef.current) {
        observer.unobserve(sectionRef.current);
      }
    };
  }, []);

  return (
    <section ref={sectionRef} className="mb-32 py-12">
      <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
        {stats.map((stat, index) => (
          <StatCard
            key={index}
            {...stat}
            isVisible={isVisible}
            delay={index * 100}
          />
        ))}
      </div>
    </section>
  );
}

function StatCard({ value, suffix, label, duration, decimals = 0, isVisible, delay }) {
  const [count, setCount] = useState(0);

  useEffect(() => {
    if (!isVisible) return;

    const timeout = setTimeout(() => {
      let startTime;
      const startValue = 0;
      const endValue = value;

      const easeOutQuad = (t) => t * (2 - t);

      const animate = (timestamp) => {
        if (!startTime) startTime = timestamp;
        const progress = Math.min((timestamp - startTime) / duration, 1);
        
        const easedProgress = easeOutQuad(progress);
        const currentValue = startValue + (endValue - startValue) * easedProgress;
        
        setCount(currentValue);

        if (progress < 1) {
          requestAnimationFrame(animate);
        }
      };

      requestAnimationFrame(animate);
    }, delay);

    return () => clearTimeout(timeout);
  }, [isVisible, value, duration, delay]);

  return (
    <div className="stat-card rounded-xl p-6 text-center group">
      <div className="stat-number text-4xl md:text-5xl font-bold text-primary-400 mb-2 group-hover:text-primary-300 transition-colors">
        {decimals > 0 ? count.toFixed(decimals) : Math.floor(count)}
        {suffix}
      </div>
      <div className="text-sm md:text-base text-gray-400 font-medium">
        {label}
      </div>
    </div>
  );
}
