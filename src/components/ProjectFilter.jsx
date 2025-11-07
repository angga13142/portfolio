import { useMemo, useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import ProjectCard from './ProjectCard.jsx';

export default function ProjectFilter({ projects }) {
  const allTags = useMemo(() => {
    const s = new Set();
    projects.forEach(p => (p.tags || []).forEach(t => s.add(t)));
    return ['All', ...Array.from(s)];
  }, [projects]);
  const [active, setActive] = useState('All');
  const filtered = useMemo(() =>
    active === 'All' ? projects : projects.filter(p => p.tags?.includes(active)),
    [active, projects]
  );
  return (
    <div>
      <div className="flex flex-wrap gap-3 mb-10">
        {allTags.map(tag => (
          <button
            key={tag}
            className={`text-sm px-4 py-2 rounded-lg border-2 font-medium transition-all ${
              active === tag 
                ? 'bg-primary-500 text-white border-primary-500 shadow-glow-blue' 
                : 'bg-dark-800 text-gray-400 border-gray-600/30 hover:border-primary-500 hover:text-primary-400'
            }`}
            onClick={() => setActive(tag)}
          >
            {tag}
          </button>
        ))}
      </div>
      <motion.div layout className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
        <AnimatePresence>
          {filtered.map(p => (
            <motion.div 
              key={p.slug} 
              layout 
              initial={{ opacity: 0, scale: 0.95 }} 
              animate={{ opacity: 1, scale: 1 }} 
              exit={{ opacity: 0, scale: 0.95 }}
              transition={{ duration: 0.3 }}
            >
              <ProjectCard project={p} />
            </motion.div>
          ))}
        </AnimatePresence>
      </motion.div>
    </div>
  );
}
