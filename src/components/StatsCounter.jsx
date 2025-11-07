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
    <section ref={sectionRef} className="mb-32 py-16 relative">
      {/* Subtle gradient overlay for better integration */}
      <div className="absolute inset-0 bg-gradient-to-b from-transparent via-primary-500/5 to-transparent pointer-events-none rounded-3xl"></div>
      
      <div className="relative z-10">
        {/* Section Title */}
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-50 mb-3">
            Proven <span className="gradient-text">Performance</span>
          </h2>
          <p className="text-gray-400 text-lg">
            Metrics that matter — quality, reliability, excellence
          </p>
        </div>

        {/* Stats Grid */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 md:gap-6">
          {stats.map((stat, index) => (
            <StatCard
              key={index}
              {...stat}
              isVisible={isVisible}
              delay={index * 100}
            />
          ))}
        </div>
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
    <div className="stat-card rounded-2xl p-6 md:p-8 text-center group relative">
      {/* Gradient accent on top */}
      <div className="absolute top-0 inset-x-0 h-0.5 bg-gradient-to-r from-transparent via-primary-400 to-transparent opacity-0 group-hover:opacity-100 transition-opacity"></div>
      
      <div className="stat-number text-4xl md:text-5xl font-bold text-primary-400 mb-3 group-hover:text-primary-300 group-hover:scale-110 transition-all duration-300">
        {decimals > 0 ? count.toFixed(decimals) : Math.floor(count)}
        {suffix}
      </div>
      <div className="text-sm md:text-base text-gray-400 font-medium group-hover:text-gray-300 transition-colors">
        {label}
      </div>
      
      {/* Subtle glow effect on hover */}
      <div className="absolute inset-0 rounded-2xl bg-gradient-to-br from-primary-500/0 via-primary-500/0 to-primary-500/0 group-hover:from-primary-500/5 group-hover:via-transparent group-hover:to-purple-500/5 transition-all duration-500 pointer-events-none"></div>
    </div>
  );
}
