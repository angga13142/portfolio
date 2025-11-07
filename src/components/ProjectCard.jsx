import { motion } from 'framer-motion';

export default function ProjectCard({ project }) {
  return (
    <motion.a
      href={`/projects/${project.slug}`}
      className="dark-card group rounded-xl overflow-hidden block hover-scale"
      initial={{ opacity: 0, y: 20 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true }}
      transition={{ duration: 0.5, ease: "easeOut" }}
    >
      {project.cover && (
        <div className="aspect-video bg-dark-800 overflow-hidden">
          <img
            src={project.cover}
            alt={project.alt || project.title}
            className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700 ease-out"
            loading="lazy"
            width="1200"
            height="675"
          />
        </div>
      )}
      <div className="p-6">
        <h3 className="font-bold text-xl mb-2 text-gray-50 group-hover:text-primary-400 transition-colors duration-300">
          {project.title}
        </h3>
        <p className="text-sm text-gray-400 line-clamp-3 mb-4 leading-relaxed">
          {project.summary}
        </p>
        {project.tags && (
          <div className="flex flex-wrap gap-2">
            {project.tags.map((t) => (
              <span 
                key={t} 
                className="text-xs px-3 py-1.5 rounded-md bg-dark-700 text-gray-300 border border-gray-600/30 group-hover:border-primary-500/50 group-hover:text-primary-400 transition-all duration-300"
              >
                {t}
              </span>
            ))}
          </div>
        )}
      </div>
    </motion.a>
  );
}
