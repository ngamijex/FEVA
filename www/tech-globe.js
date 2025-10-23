// Interactive Technology Globe
class TechGlobe {
  constructor() {
    this.globe = document.getElementById('techGlobe');
    this.infoPanel = document.getElementById('techInfoPanel');
    this.techName = document.getElementById('techName');
    this.techDescription = document.getElementById('techDescription');
    this.isDragging = false;
    this.rotationX = 10;
    this.rotationY = 0;
    this.lastMouseX = 0;
    this.lastMouseY = 0;
    
    this.techData = {
      // Cloud & Infrastructure
      'aws': {
        name: 'Amazon Web Services',
        description: 'Leading cloud computing platform providing scalable infrastructure, storage, and computing services for enterprise applications.'
      },
      'azure': {
        name: 'Microsoft Azure',
        description: 'Comprehensive cloud platform offering AI, analytics, and hybrid cloud solutions for modern business needs.'
      },
      'gcp': {
        name: 'Google Cloud Platform',
        description: 'Advanced cloud services with machine learning, data analytics, and global infrastructure capabilities.'
      },
      'docker': {
        name: 'Docker',
        description: 'Containerization platform that enables consistent deployment across development, testing, and production environments.'
      },
      'kubernetes': {
        name: 'Kubernetes',
        description: 'Open-source container orchestration system for automating deployment, scaling, and management of applications.'
      },
      'terraform': {
        name: 'Terraform',
        description: 'Infrastructure as Code tool for building, changing, and versioning infrastructure safely and efficiently.'
      },
      'ansible': {
        name: 'Ansible',
        description: 'Automation platform for configuration management, application deployment, and task automation.'
      },
      'jenkins': {
        name: 'Jenkins',
        description: 'Open-source automation server for building, testing, and deploying software projects.'
      },
      'gitlab': {
        name: 'GitLab',
        description: 'Complete DevOps platform providing Git repository management, CI/CD, and project management tools.'
      },
      'github': {
        name: 'GitHub',
        description: 'Web-based platform for version control and collaboration using Git repositories.'
      },
      'git': {
        name: 'Git',
        description: 'Distributed version control system managing our codebase and enabling collaborative development workflows.'
      },
      'linux': {
        name: 'Linux',
        description: 'Open-source operating system powering our servers and providing robust, secure infrastructure foundation.'
      },
      'nginx': {
        name: 'Nginx',
        description: 'High-performance web server and reverse proxy server for load balancing and HTTP caching.'
      },
      'apache': {
        name: 'Apache',
        description: 'Open-source web server software that powers millions of websites worldwide.'
      },
      'vagrant': {
        name: 'Vagrant',
        description: 'Development environment management tool for creating and configuring virtual development environments.'
      },
      
      // Programming Languages
      'python': {
        name: 'Python',
        description: 'Versatile programming language powering our backend services, data analysis, and machine learning solutions.'
      },
      'javascript': {
        name: 'JavaScript',
        description: 'Dynamic programming language driving our frontend applications and full-stack development capabilities.'
      },
      'typescript': {
        name: 'TypeScript',
        description: 'Typed superset of JavaScript that compiles to plain JavaScript, providing better development experience.'
      },
      'go': {
        name: 'Go',
        description: 'Efficient programming language designed for building scalable, concurrent applications and microservices.'
      },
      'rust': {
        name: 'Rust',
        description: 'Systems programming language focused on safety, speed, and concurrency for high-performance applications.'
      },
      'java': {
        name: 'Java',
        description: 'Object-oriented programming language for building enterprise-scale applications and Android development.'
      },
      'csharp': {
        name: 'C#',
        description: 'Modern programming language for building Windows applications, web services, and enterprise solutions.'
      },
      'php': {
        name: 'PHP',
        description: 'Server-side scripting language widely used for web development and dynamic content creation.'
      },
      'ruby': {
        name: 'Ruby',
        description: 'Dynamic programming language known for its elegant syntax and powerful web framework Ruby on Rails.'
      },
      'kotlin': {
        name: 'Kotlin',
        description: 'Modern programming language for Android development and server-side applications.'
      },
      'swift': {
        name: 'Swift',
        description: 'Apple\'s programming language for iOS, macOS, watchOS, and tvOS application development.'
      },
      'scala': {
        name: 'Scala',
        description: 'Functional programming language that runs on the Java Virtual Machine with strong static typing.'
      },
      'clojure': {
        name: 'Clojure',
        description: 'Dynamic functional programming language that runs on the Java Virtual Machine.'
      },
      'elixir': {
        name: 'Elixir',
        description: 'Functional, concurrent programming language built on top of the Erlang Virtual Machine.'
      },
      
      // Frontend Frameworks
      'react': {
        name: 'React',
        description: 'Modern JavaScript library for building interactive user interfaces with component-based architecture.'
      },
      'vue': {
        name: 'Vue.js',
        description: 'Progressive JavaScript framework for building user interfaces and single-page applications.'
      },
      'angular': {
        name: 'Angular',
        description: 'Platform and framework for building mobile and desktop web applications using TypeScript.'
      },
      'svelte': {
        name: 'Svelte',
        description: 'Modern JavaScript framework that compiles components to highly optimized vanilla JavaScript.'
      },
      'nextjs': {
        name: 'Next.js',
        description: 'React framework for production with features like server-side rendering and static site generation.'
      },
      'nuxt': {
        name: 'Nuxt.js',
        description: 'Vue.js framework for creating modern web applications with server-side rendering capabilities.'
      },
      'nodejs': {
        name: 'Node.js',
        description: 'JavaScript runtime environment enabling server-side development and real-time applications.'
      },
      'express': {
        name: 'Express',
        description: 'Fast, unopinionated web framework for Node.js applications and APIs.'
      },
      'nestjs': {
        name: 'NestJS',
        description: 'Progressive Node.js framework for building efficient and scalable server-side applications.'
      },
      'fastapi': {
        name: 'FastAPI',
        description: 'Modern, fast web framework for building APIs with Python based on standard type hints.'
      },
      'django': {
        name: 'Django',
        description: 'High-level Python web framework that encourages rapid development and clean, pragmatic design.'
      },
      'flask': {
        name: 'Flask',
        description: 'Lightweight Python web framework for building web applications and APIs.'
      },
      'rails': {
        name: 'Ruby on Rails',
        description: 'Full-stack web application framework written in Ruby following the MVC pattern.'
      },
      'spring': {
        name: 'Spring Framework',
        description: 'Application framework and inversion of control container for the Java platform.'
      },
      
      // Databases
      'postgresql': {
        name: 'PostgreSQL',
        description: 'Advanced open-source relational database system with robust data integrity and extensibility features.'
      },
      'mongodb': {
        name: 'MongoDB',
        description: 'NoSQL database platform providing flexible document storage and high-performance data management.'
      },
      'mysql': {
        name: 'MySQL',
        description: 'Popular open-source relational database management system for web applications.'
      },
      'redis': {
        name: 'Redis',
        description: 'In-memory data structure store used for caching, session management, and real-time analytics.'
      },
      'elasticsearch': {
        name: 'Elasticsearch',
        description: 'Distributed search and analytics engine for real-time data exploration and visualization.'
      },
      'cassandra': {
        name: 'Cassandra',
        description: 'Distributed NoSQL database designed for handling large amounts of data across many commodity servers.'
      },
      'neo4j': {
        name: 'Neo4j',
        description: 'Graph database platform for building applications with highly connected data.'
      },
      'influxdb': {
        name: 'InfluxDB',
        description: 'Time series database optimized for high-write-volume use cases like monitoring and IoT.'
      },
      'sqlite': {
        name: 'SQLite',
        description: 'Lightweight, serverless SQL database engine embedded in applications.'
      },
      'firebase': {
        name: 'Firebase',
        description: 'Google\'s mobile and web application development platform with real-time database capabilities.'
      },
      'supabase': {
        name: 'Supabase',
        description: 'Open-source Firebase alternative providing PostgreSQL database with real-time subscriptions.'
      },
      'prisma': {
        name: 'Prisma',
        description: 'Next-generation ORM for Node.js and TypeScript with type-safe database access.'
      },
      'oracle': {
        name: 'Oracle Database',
        description: 'Enterprise-grade relational database management system with advanced security and performance features.'
      },
      'sqlserver': {
        name: 'SQL Server',
        description: 'Microsoft\'s relational database management system for enterprise applications and data warehousing.'
      },
      
      // AI/ML & Data Science
      'tensorflow': {
        name: 'TensorFlow',
        description: 'Open-source machine learning platform for building and deploying AI applications.'
      },
      'pytorch': {
        name: 'PyTorch',
        description: 'Open-source machine learning library for deep learning research and production deployment.'
      },
      'opencv': {
        name: 'OpenCV',
        description: 'Computer vision library providing tools for image processing, machine learning, and computer vision.'
      },
      'pandas': {
        name: 'Pandas',
        description: 'Data manipulation and analysis library for Python with powerful data structures.'
      },
      'numpy': {
        name: 'NumPy',
        description: 'Fundamental package for scientific computing with Python, providing array objects and tools.'
      },
      'scikit': {
        name: 'Scikit-learn',
        description: 'Machine learning library for Python with simple and efficient tools for data mining and analysis.'
      },
      'jupyter': {
        name: 'Jupyter',
        description: 'Interactive computing platform for data science, machine learning, and scientific computing.'
      },
      'r': {
        name: 'R',
        description: 'Programming language and environment for statistical computing and graphics.'
      },
      'matlab': {
        name: 'MATLAB',
        description: 'High-level programming language and environment for numerical computation and visualization.'
      },
      'julia': {
        name: 'Julia',
        description: 'High-performance programming language for technical computing with dynamic typing.'
      },
      'hadoop': {
        name: 'Hadoop',
        description: 'Open-source framework for distributed storage and processing of big data sets.'
      },
      'spark': {
        name: 'Apache Spark',
        description: 'Unified analytics engine for large-scale data processing and machine learning.'
      },
      'kafka': {
        name: 'Apache Kafka',
        description: 'Distributed event streaming platform for building real-time data pipelines and streaming applications.'
      },
      'airflow': {
        name: 'Apache Airflow',
        description: 'Platform for programmatically authoring, scheduling, and monitoring workflows.'
      }
    };
    
    this.init();
  }
  
  init() {
    if (!this.globe) return;
    
    this.setupEventListeners();
    this.setupTechIconHovers();
    this.startAutoRotation();
  }
  
  setupEventListeners() {
    // Mouse events for dragging
    this.globe.addEventListener('mousedown', this.onMouseDown.bind(this));
    document.addEventListener('mousemove', this.onMouseMove.bind(this));
    document.addEventListener('mouseup', this.onMouseUp.bind(this));
    
    // Touch events for mobile
    this.globe.addEventListener('touchstart', this.onTouchStart.bind(this));
    document.addEventListener('touchmove', this.onTouchMove.bind(this));
    document.addEventListener('touchend', this.onTouchEnd.bind(this));
    
    // Prevent context menu on right click
    this.globe.addEventListener('contextmenu', (e) => e.preventDefault());
  }
  
  setupTechIconHovers() {
    const techIcons = document.querySelectorAll('.tech-icon');
    
    techIcons.forEach(icon => {
      const techKey = icon.getAttribute('data-tech');
      
      icon.addEventListener('mouseenter', () => {
        this.showTechInfo(techKey);
        this.stopRotation();
      });
      
      icon.addEventListener('mouseleave', () => {
        this.hideTechInfo();
        this.resumeAutoRotation();
      });
      
      icon.addEventListener('click', () => {
        this.showTechInfo(techKey);
        this.stopRotation();
      });
    });
    
    // Pause when hovering over info panel
    if (this.infoPanel) {
      this.infoPanel.addEventListener('mouseenter', () => {
        this.stopRotation();
      });
      
      this.infoPanel.addEventListener('mouseleave', () => {
        if (!document.querySelector('.tech-icon:hover')) {
          this.resumeAutoRotation();
        }
      });
    }
  }
  
  onMouseDown(e) {
    this.isDragging = true;
    this.lastMouseX = e.clientX;
    this.lastMouseY = e.clientY;
    this.globe.style.cursor = 'grabbing';
    this.pauseAutoRotation();
  }
  
  onMouseMove(e) {
    if (!this.isDragging) return;
    
    const deltaX = e.clientX - this.lastMouseX;
    const deltaY = e.clientY - this.lastMouseY;
    
    this.rotationY += deltaX * 0.5;
    this.rotationX -= deltaY * 0.5;
    
    // Constrain rotation
    this.rotationX = Math.max(-90, Math.min(90, this.rotationX));
    
    this.updateGlobeRotation();
    
    this.lastMouseX = e.clientX;
    this.lastMouseY = e.clientY;
  }
  
  onMouseUp() {
    this.isDragging = false;
    this.globe.style.cursor = 'grab';
    this.resumeAutoRotation();
  }
  
  onTouchStart(e) {
    e.preventDefault();
    const touch = e.touches[0];
    this.lastMouseX = touch.clientX;
    this.lastMouseY = touch.clientY;
    this.isDragging = true;
    this.pauseAutoRotation();
  }
  
  onTouchMove(e) {
    if (!this.isDragging) return;
    e.preventDefault();
    
    const touch = e.touches[0];
    const deltaX = touch.clientX - this.lastMouseX;
    const deltaY = touch.clientY - this.lastMouseY;
    
    this.rotationY += deltaX * 0.5;
    this.rotationX -= deltaY * 0.5;
    
    this.rotationX = Math.max(-90, Math.min(90, this.rotationX));
    
    this.updateGlobeRotation();
    
    this.lastMouseX = touch.clientX;
    this.lastMouseY = touch.clientY;
  }
  
  onTouchEnd() {
    this.isDragging = false;
    this.resumeAutoRotation();
  }
  
  updateGlobeRotation() {
    this.globe.style.transform = `rotateX(${this.rotationX}deg) rotateY(${this.rotationY}deg)`;
  }
  
  showTechInfo(techKey) {
    const tech = this.techData[techKey];
    if (!tech) return;
    
    // Fade out
    this.infoPanel.style.opacity = '0';
    this.infoPanel.style.transform = 'translateY(10px)';
    
    setTimeout(() => {
      this.techName.textContent = tech.name;
      this.techDescription.textContent = tech.description;
      
      // Fade in
      this.infoPanel.style.transition = 'all 0.4s cubic-bezier(0.4, 0, 0.2, 1)';
      this.infoPanel.style.opacity = '1';
      this.infoPanel.style.transform = 'translateY(0)';
    }, 150);
  }
  
  hideTechInfo() {
    this.infoPanel.style.transition = 'all 0.3s ease';
    this.techName.textContent = 'Hover over a technology';
    this.techDescription.textContent = 'Select a technology icon to learn more about our expertise.';
  }
  
  startAutoRotation() {
    this.autoRotateInterval = setInterval(() => {
      if (!this.isDragging) {
        this.rotationY += 0.5;
        this.updateGlobeRotation();
      }
    }, 50);
  }
  
  stopRotation() {
    if (this.autoRotateInterval) {
      clearInterval(this.autoRotateInterval);
      this.autoRotateInterval = null;
    }
  }
  
  pauseAutoRotation() {
    this.stopRotation();
  }
  
  resumeAutoRotation() {
    // Clear any existing interval first
    this.stopRotation();
    // Start fresh rotation
    this.startAutoRotation();
  }
  
  destroy() {
    this.pauseAutoRotation();
    // Remove event listeners if needed
  }
}

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
  new TechGlobe();
});

// Re-initialize if Shiny updates the DOM
if (typeof Shiny !== 'undefined') {
  $(document).on('shiny:value', function(event) {
    setTimeout(() => {
      if (document.getElementById('techGlobe')) {
        new TechGlobe();
      }
    }, 100);
  });
}
