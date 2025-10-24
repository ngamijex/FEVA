# ================================================================
# FEVA - PROFESSIONAL WEBSITE FOUNDATION
# World-Class Technology Company Website
# Clean, Scalable, and Future-Ready Architecture
# ================================================================
# Load Required Libraries
library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(htmltools)
library(DT)
library(plotly)
library(leaflet)
library(waiter)
library(shinycssloaders)
library(shinyjs)
library(htmlwidgets)
library(shinyjs)

# ================================================================
# UI DEFINITION - PROFESSIONAL STRUCTURE
# ================================================================

ui <- tagList(
  
  # ===== HEAD SECTION - META & DEPENDENCIES =====
  tags$head(
    # Essential Meta Tags
    tags$meta(charset = "UTF-8"),
    tags$meta(name = "viewport", content = "width=device-width, initial-scale=1.0"),
    tags$meta(name = "description", content = "Feva - Leading African technology company specializing in AI, blockchain, and digital transformation solutions"),
    tags$meta(name = "keywords", content = "AI, Machine Learning, Blockchain, Digital Transformation, Africa Technology, Software Development"),
    tags$meta(name = "author", content = "Feva Technologies"),
    
    # Social Media Meta Tags
    tags$meta(property = "og:title", content = "Feva - Intelligent Technology Solutions for Africa"),
    tags$meta(property = "og:description", content = "Transforming Africa through innovative AI, blockchain, and cloud solutions"),
    tags$meta(property = "og:type", content = "website"),
    tags$meta(property = "og:url", content = "https://feva.africa"),
    tags$meta(property = "og:image", content = "/assets/feva-social-preview.jpg"),
    
    # Twitter Card Meta Tags
    tags$meta(name = "twitter:card", content = "summary_large_image"),
    tags$meta(name = "twitter:title", content = "Feva - The Future of African Technology"),
    tags$meta(name = "twitter:description", content = "Leading African tech company building intelligent solutions for the future"),
    tags$meta(name = "twitter:image", content = "/assets/feva-twitter-card.jpg"),
    
    # Page Title
    tags$title("Feva - Intelligent Technology Solutions for Africa"),
    
    # Preload Critical Resources
    tags$link(rel = "preload", href = "https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap", as = "style"),
    tags$link(rel = "preload", href = "https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;600&display=swap", as = "style"),
    
    # External Font Dependencies
    tags$link(rel = "stylesheet", href = "https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"),
    tags$link(rel = "stylesheet", href = "https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;600&display=swap"),
    
    # Icon Dependencies
    tags$link(rel = "stylesheet", href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"),
    
    # Animation Libraries
    tags$link(rel = "stylesheet", href = "https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"),
    tags$link(rel = "stylesheet", href = "https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css"),
    
    # Custom CSS (will be added later)
    includeCSS("www/feva-styles.css"),
    
    # External JavaScript Dependencies
    tags$script(src = "https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"),
    tags$script(src = "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"),
    tags$script(src = "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/ScrollTrigger.min.js"),
    tags$script(src = "https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"),
    
    # Custom JavaScript (will be added later)
    includeScript("www/feva-animations.js"),
    includeScript("www/tech-globe.js"),
    includeScript("www/matrix-rain.js"),
    
    # Initialize Shiny JS
    useShinyjs()
  ),
  
  # ===== LOADING SCREEN =====
  use_waiter(),
  waiter_show_on_load(
    html = div(
      class = "loading-screen",
      div(
        class = "loading-content",
        div(class = "logo-container",
            h1("FEVA", class = "loading-logo"),
            p("Intelligent Technology Solutions", class = "loading-tagline")
        ),
        div(class = "loading-spinner"),
        div(class = "loading-progress",
            div(class = "progress-bar"),
            p("Loading...", class = "progress-text")
        )
      )
    ),
    color = "rgba(17, 24, 39, 0.95)"
  ),
  
  # ===== MAIN APPLICATION WRAPPER =====
  div(
    class = "app-wrapper",
    id = "main-app",
    
    # ===== NAVIGATION HEADER =====
    tags$head(
      # Link to your custom navbar CSS
      tags$link(rel = "stylesheet", type = "text/css", href = "nav.css"),
      
      # Link to your custom navbar JavaScript
      tags$script(src = "nav.js"),
      
      # Roadmap JavaScript
      tags$script(src = "roadmap.js"),
      
      # Optional: Add Google Fonts for enhanced typography
      tags$link(
        rel = "stylesheet",
        href = "https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Space+Grotesk:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap"
      ),
      
      # Optional: Add Font Awesome for icons
      tags$link(
        rel = "stylesheet",
        href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      )
    ),
    
    # Your updated header section
    tags$header(
      class = "site-header",
      id = "site-header",
      
      div(
        class = "header-container",
        
        # Logo & Brand
        div(
          class = "brand-section",
          div(
            class = "brand-logo",
            img(src = "feva.png", alt = "FEVA", class = "brand-image")
          )
        ),
        
        # Main Navigation
        tags$nav(
          class = "main-navigation",
          id = "main-nav",
          
          div(
            class = "nav-menu",
            div(class = "nav-item", `data-target` = "home",
                tags$a(href = "#home", "Home")
            ),
            div(class = "nav-item", `data-target` = "about",
                tags$a(href = "#about", "About")
            ),
            div(class = "nav-item dropdown", `data-target` = "services",
                tags$a(href = "#services", "Services"),
                div(class = "dropdown-menu",
                    tags$a(href = "#ai-ml", "AI & Machine Learning"),
                    tags$a(href = "#blockchain", "Blockchain Solutions"),
                    tags$a(href = "#cloud", "Cloud Infrastructure"),
                    tags$a(href = "#mobile", "Mobile Development"),
                    tags$a(href = "#data", "Data Analytics"),
                    tags$a(href = "#security", "Cybersecurity")
                )
            ),
            div(class = "nav-item", `data-target` = "solutions",
                tags$a(href = "#solutions", "Solutions")
            ),
            div(class = "nav-item", `data-target` = "portfolio",
                tags$a(href = "#portfolio", "Portfolio")
            ),
            div(class = "nav-item", `data-target` = "team",
                tags$a(href = "#team", "Team")
            ),
            div(class = "nav-item", `data-target` = "contact",
                tags$a(href = "#contact", "Contact")
            )
          )
        ),
        
        # Header Actions
        div(
          class = "header-actions",

          # CTA Button
          div(
            class = "btn btn-primary btn-cta",
            id = "header_cta",
            onclick = "Shiny.setInputValue('header_cta', Math.random(), {priority: 'event'});",
            span("Talk to Us", class = "btn-text"),
            icon("external-link-alt", class = "btn-arrow")
          ),
          
          # Mobile Menu Toggle
          div(
            class = "mobile-menu-toggle",
            id = "mobile-menu-toggle",
            span(class = "hamburger-line"),
            span(class = "hamburger-line"),
            span(class = "hamburger-line")
          )
        )
      )
    ),
    
    # ===== MAIN CONTENT WRAPPER =====
    tags$main(
      class = "main-content",
      id = "main-content",
      
      # ===== HERO SECTION =====
      tags$section(
        class = "hero-section",
        id = "home",
        
        # Hero Background Elements
        div(class = "hero-background",
            div(class = "hero-gradient"),
            div(class = "hero-pattern"),
            div(class = "hero-particles", id = "hero-particles")
        ),
        
        # Hero Content Container
        div(
          class = "hero-container",
          
          # Hero Content
          div(
            class = "hero-content",
            
            
            # Hero Headlines
            div(
              class = "hero-headlines",
              h1(
                class = "hero-title",
                "Intelligent Technology",
                tags$br(),
                "for ", 
                span("Africa's Future", class = "title-accent")
              ),
              
              p(
                class = "hero-subtitle",
                "We combine deep analytical thinking with cutting-edge AI, blockchain, and cloud technologies to build intelligent, future-ready solutions that transform industries across Africa and beyond."
              )
            ),
            
            # Hero Statistics - Removed
            # Hero Actions - Removed
          ),
          
          # Updated R HTML Structure
          div(
            class = "hero-visual",
              
              # Binary Matrix Code Rain Animation
              div(
                class = "matrix-rain",
                id = "matrixRain"
              )
            )
          
        )
      ),
      
      # ===== ABOUT SECTION =====
      tags$section(
        class = "about-section",
        id = "about",
        
        # About Background Elements
        div(class = "about-background"),
        
        # About Container
        div(
          class = "about-container",
          
          # About Header
          div(
            class = "about-header",
            
            div(
              class = "about-badge",
              icon("code", class = "badge-icon"),
              span("Technology Excellence")
            ),
            
            h2(
              class = "about-title",
              "Building Africa's",
              tags$br(),
              "Digital Future"
            ),
            
            p(
              class = "about-subtitle",
              "We are a cutting-edge technology company specializing in enterprise solutions, cloud infrastructure, and digital transformation across Africa. Our mission is to bridge the technology gap and empower businesses with world-class digital capabilities."
            )
          ),
          
          
          # Technology Stack - Interactive Globe
          div(
            class = "tech-stack-section",
            
            h3(class = "tech-stack-title", "Our Technology Stack"),
            
            div(
              class = "tech-globe-container",
              
              div(
                class = "tech-globe",
                id = "techGlobe",
                
                # Technology icons positioned on sphere - Expanded collection with better spacing
                # Cloud & Infrastructure (Equator)
                div(class = "tech-icon", "data-tech" = "aws", style = "transform: rotateY(0deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg", alt = "AWS")
                ),
                div(class = "tech-icon", "data-tech" = "azure", style = "transform: rotateY(25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/azure/azure-original.svg", alt = "Azure")
                ),
                div(class = "tech-icon", "data-tech" = "gcp", style = "transform: rotateY(50deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/googlecloud/googlecloud-original.svg", alt = "Google Cloud")
                ),
                div(class = "tech-icon", "data-tech" = "docker", style = "transform: rotateY(75deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg", alt = "Docker")
                ),
                div(class = "tech-icon", "data-tech" = "kubernetes", style = "transform: rotateY(100deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-original.svg", alt = "Kubernetes")
                ),
                div(class = "tech-icon", "data-tech" = "terraform", style = "transform: rotateY(125deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/terraform/terraform-original.svg", alt = "Terraform")
                ),
                div(class = "tech-icon", "data-tech" = "ansible", style = "transform: rotateY(150deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ansible/ansible-original.svg", alt = "Ansible")
                ),
                div(class = "tech-icon", "data-tech" = "jenkins", style = "transform: rotateY(175deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/jenkins/jenkins-original.svg", alt = "Jenkins")
                ),
                div(class = "tech-icon", "data-tech" = "gitlab", style = "transform: rotateY(200deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/gitlab/gitlab-original.svg", alt = "GitLab")
                ),
                div(class = "tech-icon", "data-tech" = "github", style = "transform: rotateY(225deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg", alt = "GitHub")
                ),
                div(class = "tech-icon", "data-tech" = "git", style = "transform: rotateY(250deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg", alt = "Git")
                ),
                div(class = "tech-icon", "data-tech" = "linux", style = "transform: rotateY(275deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg", alt = "Linux")
                ),
                div(class = "tech-icon", "data-tech" = "nginx", style = "transform: rotateY(300deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nginx/nginx-original.svg", alt = "Nginx")
                ),
                div(class = "tech-icon", "data-tech" = "apache", style = "transform: rotateY(325deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/apache/apache-original-wordmark.svg", alt = "Apache")
                ),
                div(class = "tech-icon", "data-tech" = "vagrant", style = "transform: rotateY(350deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vagrant/vagrant-original.svg", alt = "Vagrant")
                ),
                
                # Programming Languages (Upper Hemisphere)
                div(class = "tech-icon", "data-tech" = "python", style = "transform: rotateY(12deg) rotateX(40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg", alt = "Python")
                ),
                div(class = "tech-icon", "data-tech" = "javascript", style = "transform: rotateY(37deg) rotateX(40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg", alt = "JavaScript")
                ),
                div(class = "tech-icon", "data-tech" = "typescript", style = "transform: rotateY(62deg) rotateX(40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg", alt = "TypeScript")
                ),
                div(class = "tech-icon", "data-tech" = "go", style = "transform: rotateY(87deg) rotateX(40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/go/go-original.svg", alt = "Go")
                ),
                div(class = "tech-icon", "data-tech" = "rust", style = "transform: rotateY(112deg) rotateX(40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/rust/rust-original.svg", alt = "Rust")
                ),
                div(class = "tech-icon", "data-tech" = "java", style = "transform: rotateY(137deg) rotateX(40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg", alt = "Java")
                ),
                div(class = "tech-icon", "data-tech" = "csharp", style = "transform: rotateY(162deg) rotateX(40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/csharp/csharp-original.svg", alt = "C#")
                ),
                div(class = "tech-icon", "data-tech" = "php", style = "transform: rotateY(187deg) rotateX(40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/php/php-original.svg", alt = "PHP")
                ),
                div(class = "tech-icon", "data-tech" = "ruby", style = "transform: rotateY(212deg) rotateX(40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ruby/ruby-original.svg", alt = "Ruby")
                ),
                div(class = "tech-icon", "data-tech" = "kotlin", style = "transform: rotateY(237deg) rotateX(40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kotlin/kotlin-original.svg", alt = "Kotlin")
                ),
                div(class = "tech-icon", "data-tech" = "swift", style = "transform: rotateY(262deg) rotateX(40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/swift/swift-original.svg", alt = "Swift")
                ),
                div(class = "tech-icon", "data-tech" = "scala", style = "transform: rotateY(287deg) rotateX(40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/scala/scala-original.svg", alt = "Scala")
                ),
                div(class = "tech-icon", "data-tech" = "clojure", style = "transform: rotateY(312deg) rotateX(40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/clojure/clojure-original.svg", alt = "Clojure")
                ),
                div(class = "tech-icon", "data-tech" = "elixir", style = "transform: rotateY(337deg) rotateX(40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/elixir/elixir-original.svg", alt = "Elixir")
                ),
                
                # Frontend Frameworks (Upper-Mid Hemisphere)
                div(class = "tech-icon", "data-tech" = "react", style = "transform: rotateY(18deg) rotateX(25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/react/react-original.svg", alt = "React")
                ),
                div(class = "tech-icon", "data-tech" = "vue", style = "transform: rotateY(43deg) rotateX(25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vuejs/vuejs-original.svg", alt = "Vue.js")
                ),
                div(class = "tech-icon", "data-tech" = "angular", style = "transform: rotateY(68deg) rotateX(25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/angular/angular-original.svg", alt = "Angular")
                ),
                div(class = "tech-icon", "data-tech" = "svelte", style = "transform: rotateY(93deg) rotateX(25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/svelte/svelte-original.svg", alt = "Svelte")
                ),
                div(class = "tech-icon", "data-tech" = "nextjs", style = "transform: rotateY(118deg) rotateX(25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/nextjs/nextjs-original.svg", alt = "Next.js", style = "filter: invert(1);")
                ),
                div(class = "tech-icon", "data-tech" = "nuxt", style = "transform: rotateY(143deg) rotateX(25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nuxtjs/nuxtjs-original.svg", alt = "Nuxt.js")
                ),
                div(class = "tech-icon", "data-tech" = "nodejs", style = "transform: rotateY(168deg) rotateX(25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg", alt = "Node.js")
                ),
                div(class = "tech-icon", "data-tech" = "express", style = "transform: rotateY(193deg) rotateX(25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/express/express-original.svg", alt = "Express")
                ),
                div(class = "tech-icon", "data-tech" = "nestjs", style = "transform: rotateY(218deg) rotateX(25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nestjs/nestjs-plain.svg", alt = "NestJS")
                ),
                div(class = "tech-icon", "data-tech" = "fastapi", style = "transform: rotateY(243deg) rotateX(25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/fastapi/fastapi-original.svg", alt = "FastAPI")
                ),
                div(class = "tech-icon", "data-tech" = "django", style = "transform: rotateY(268deg) rotateX(25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/django/django-plain.svg", alt = "Django")
                ),
                div(class = "tech-icon", "data-tech" = "flask", style = "transform: rotateY(293deg) rotateX(25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flask/flask-original.svg", alt = "Flask")
                ),
                div(class = "tech-icon", "data-tech" = "rails", style = "transform: rotateY(318deg) rotateX(25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/rails/rails-plain-wordmark.svg", alt = "Rails")
                ),
                div(class = "tech-icon", "data-tech" = "spring", style = "transform: rotateY(343deg) rotateX(25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/spring/spring-original.svg", alt = "Spring")
                ),
                
                # Databases (Lower-Mid Hemisphere)
                div(class = "tech-icon", "data-tech" = "postgresql", style = "transform: rotateY(20deg) rotateX(-25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-original.svg", alt = "PostgreSQL")
                ),
                div(class = "tech-icon", "data-tech" = "mongodb", style = "transform: rotateY(45deg) rotateX(-25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mongodb/mongodb-original.svg", alt = "MongoDB")
                ),
                div(class = "tech-icon", "data-tech" = "mysql", style = "transform: rotateY(70deg) rotateX(-25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original.svg", alt = "MySQL")
                ),
                div(class = "tech-icon", "data-tech" = "redis", style = "transform: rotateY(95deg) rotateX(-25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/redis/redis-original.svg", alt = "Redis")
                ),
                div(class = "tech-icon", "data-tech" = "elasticsearch", style = "transform: rotateY(120deg) rotateX(-25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/elasticsearch/elasticsearch-original.svg", alt = "Elasticsearch")
                ),
                div(class = "tech-icon", "data-tech" = "cassandra", style = "transform: rotateY(145deg) rotateX(-25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/cassandra/cassandra-original.svg", alt = "Cassandra")
                ),
                div(class = "tech-icon", "data-tech" = "neo4j", style = "transform: rotateY(170deg) rotateX(-25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/neo4j/neo4j-original.svg", alt = "Neo4j")
                ),
                div(class = "tech-icon", "data-tech" = "influxdb", style = "transform: rotateY(195deg) rotateX(-25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/influxdb/influxdb-original.svg", alt = "InfluxDB")
                ),
                div(class = "tech-icon", "data-tech" = "sqlite", style = "transform: rotateY(220deg) rotateX(-25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/sqlite/sqlite-original.svg", alt = "SQLite")
                ),
                div(class = "tech-icon", "data-tech" = "firebase", style = "transform: rotateY(245deg) rotateX(-25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/firebase/firebase-plain.svg", alt = "Firebase")
                ),
                div(class = "tech-icon", "data-tech" = "supabase", style = "transform: rotateY(270deg) rotateX(-25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/supabase/supabase-original.svg", alt = "Supabase")
                ),
                div(class = "tech-icon", "data-tech" = "prisma", style = "transform: rotateY(295deg) rotateX(-25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/prisma/prisma-original.svg", alt = "Prisma")
                ),
                div(class = "tech-icon", "data-tech" = "oracle", style = "transform: rotateY(320deg) rotateX(-25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/oracle/oracle-original.svg", alt = "Oracle")
                ),
                div(class = "tech-icon", "data-tech" = "sqlserver", style = "transform: rotateY(345deg) rotateX(-25deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/microsoftsqlserver/microsoftsqlserver-plain.svg", alt = "SQL Server")
                ),
                
                # AI/ML & Data Science (Lower Hemisphere)
                div(class = "tech-icon", "data-tech" = "tensorflow", style = "transform: rotateY(25deg) rotateX(-40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/tensorflow/tensorflow-original.svg", alt = "TensorFlow")
                ),
                div(class = "tech-icon", "data-tech" = "pytorch", style = "transform: rotateY(50deg) rotateX(-40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/pytorch/pytorch-original.svg", alt = "PyTorch")
                ),
                div(class = "tech-icon", "data-tech" = "opencv", style = "transform: rotateY(75deg) rotateX(-40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/opencv/opencv-original.svg", alt = "OpenCV")
                ),
                div(class = "tech-icon", "data-tech" = "pandas", style = "transform: rotateY(100deg) rotateX(-40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/pandas/pandas-original.svg", alt = "Pandas")
                ),
                div(class = "tech-icon", "data-tech" = "numpy", style = "transform: rotateY(125deg) rotateX(-40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/numpy/numpy-original.svg", alt = "NumPy")
                ),
                div(class = "tech-icon", "data-tech" = "scikit", style = "transform: rotateY(150deg) rotateX(-40deg) translateZ(180px);",
                    img(src = "https://upload.wikimedia.org/wikipedia/commons/0/05/Scikit_learn_logo_small.svg", alt = "Scikit-learn")
                ),
                div(class = "tech-icon", "data-tech" = "jupyter", style = "transform: rotateY(175deg) rotateX(-40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/jupyter/jupyter-original.svg", alt = "Jupyter")
                ),
                div(class = "tech-icon", "data-tech" = "r", style = "transform: rotateY(200deg) rotateX(-40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/r/r-original.svg", alt = "R")
                ),
                div(class = "tech-icon", "data-tech" = "matlab", style = "transform: rotateY(225deg) rotateX(-40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/matlab/matlab-original.svg", alt = "MATLAB")
                ),
                div(class = "tech-icon", "data-tech" = "julia", style = "transform: rotateY(250deg) rotateX(-40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/julia/julia-original.svg", alt = "Julia")
                ),
                div(class = "tech-icon", "data-tech" = "hadoop", style = "transform: rotateY(275deg) rotateX(-40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/hadoop/hadoop-original.svg", alt = "Hadoop")
                ),
                div(class = "tech-icon", "data-tech" = "spark", style = "transform: rotateY(300deg) rotateX(-40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/apachespark/apachespark-original.svg", alt = "Apache Spark")
                ),
                div(class = "tech-icon", "data-tech" = "kafka", style = "transform: rotateY(325deg) rotateX(-40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/apachekafka/apachekafka-original.svg", alt = "Apache Kafka")
                ),
                div(class = "tech-icon", "data-tech" = "airflow", style = "transform: rotateY(350deg) rotateX(-40deg) translateZ(180px);",
                    img(src = "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/apacheairflow/apacheairflow-original.svg", alt = "Apache Airflow")
                )
              ),
              
              div(
                class = "tech-info-panel",
                id = "techInfoPanel",
                div(class = "tech-info-content",
                    h4(id = "techName", "Hover over a technology"),
                    p(id = "techDescription", "Select a technology icon to learn more about our expertise.")
                )
              )
            )
          )
        )
      ),
      
      # ===== SERVICES SECTION =====
      tags$section(
        class = "services-section",
        id = "services",
        
        # Services Background Elements
        div(class = "services-background"),
        
        # Services Container
        div(
          class = "services-container",
          
          # Services Header
          div(
            class = "services-header",
            
            div(
              class = "services-badge",
              icon("cogs", class = "badge-icon"),
              span("Enterprise Solutions")
            ),
            
            h2(
              class = "services-title",
              "Technology Services",
              tags$br(),
              "That Drive Results"
            ),
            
            p(
              class = "services-subtitle",
              "We deliver comprehensive technology solutions designed for African businesses. From cloud infrastructure to custom software development, our services are built to scale and perform in demanding enterprise environments."
            )
          ),
          
          # Main Services Grid
          div(
            class = "main-services-grid",
            
            # Cloud Infrastructure Service
            div(class = "service-card primary-service",
                div(class = "service-header",
                    div(class = "service-icon", icon("cloud")),
                    div(class = "service-badge", "Infrastructure")
                ),
                h3("Cloud Infrastructure"),
                p("Enterprise-grade cloud solutions with 99.9% uptime guarantee. We design, deploy, and manage scalable infrastructure across AWS, Azure, and Google Cloud platforms."),
                
                div(class = "service-features",
                    div(class = "feature-item",
                        icon("check-circle", class = "feature-icon"),
                        span("Auto-scaling & Load Balancing")
                    ),
                    div(class = "feature-item",
                        icon("check-circle", class = "feature-icon"),
                        span("Disaster Recovery & Backup")
                    ),
                    div(class = "feature-item",
                        icon("check-circle", class = "feature-icon"),
                        span("24/7 Monitoring & Support")
                    ),
                    div(class = "feature-item",
                        icon("check-circle", class = "feature-icon"),
                        span("Security & Compliance")
                    )
                ),
                
                div(class = "service-tech",
                    span("AWS", class = "tech-tag"),
                    span("Azure", class = "tech-tag"),
                    span("Docker", class = "tech-tag"),
                    span("Kubernetes", class = "tech-tag")
                ),
                
                div(class = "service-footer",
                    actionButton("learn_cloud", "Learn More", class = "btn btn-outline"),
                    actionButton("contact_cloud", "Get Quote", class = "btn btn-primary")
                )
            ),
            
            # Software Development Service
            div(class = "service-card",
                div(class = "service-header",
                    div(class = "service-icon", icon("code")),
                    div(class = "service-badge", "Development")
                ),
                h3("Custom Software Development"),
                p("Tailored software solutions built for African markets. From web applications to mobile apps, we create scalable, secure, and user-friendly software."),
                
                div(class = "service-features",
                    div(class = "feature-item",
                        icon("check-circle", class = "feature-icon"),
                        span("Web & Mobile Applications")
                    ),
                    div(class = "feature-item",
                        icon("check-circle", class = "feature-icon"),
                        span("API Development & Integration")
                    ),
                    div(class = "feature-item",
                        icon("check-circle", class = "feature-icon"),
                        span("Database Design & Optimization")
                    ),
                    div(class = "feature-item",
                        icon("check-circle", class = "feature-icon"),
                        span("Quality Assurance & Testing")
                    )
                ),
                
                div(class = "service-tech",
                    span("Python", class = "tech-tag"),
                    span("JavaScript", class = "tech-tag"),
                    span("React", class = "tech-tag"),
                    span("Node.js", class = "tech-tag")
                ),
                
                div(class = "service-footer",
                    actionButton("learn_dev", "Learn More", class = "btn btn-outline"),
                    actionButton("contact_dev", "Get Quote", class = "btn btn-primary")
                )
            ),
            
            # Data Analytics Service
            div(class = "service-card",
                div(class = "service-header",
                    div(class = "service-icon", icon("chart-line")),
                    div(class = "service-badge", "Analytics")
                ),
                h3("Data Analytics & BI"),
                p("Transform your data into actionable insights. We build comprehensive analytics platforms that help businesses make data-driven decisions and optimize operations."),
                
                div(class = "service-features",
                    div(class = "feature-item",
                        icon("check-circle", class = "feature-icon"),
                        span("Real-time Data Processing")
                    ),
                    div(class = "feature-item",
                        icon("check-circle", class = "feature-icon"),
                        span("Business Intelligence Dashboards")
                    ),
                    div(class = "feature-item",
                        icon("check-circle", class = "feature-icon"),
                        span("Predictive Analytics & ML")
                    ),
                    div(class = "feature-item",
                        icon("check-circle", class = "feature-icon"),
                        span("Data Warehousing & ETL")
                    )
                ),
                
                div(class = "service-tech",
                    span("PostgreSQL", class = "tech-tag"),
                    span("MongoDB", class = "tech-tag"),
                    span("Elasticsearch", class = "tech-tag"),
                    span("Apache Kafka", class = "tech-tag")
                ),
                
                div(class = "service-footer",
                    actionButton("learn_data", "Learn More", class = "btn btn-outline"),
                    actionButton("contact_data", "Get Quote", class = "btn btn-primary")
                )
            ),
            
            # Cybersecurity Service
            div(class = "service-card",
                div(class = "service-header",
                    div(class = "service-icon", icon("shield-alt")),
                    div(class = "service-badge", "Security")
                ),
                h3("Cybersecurity Solutions"),
                p("Protect your business with enterprise-grade security solutions. We implement comprehensive security measures to safeguard your data and infrastructure."),
                
                div(class = "service-features",
                    div(class = "feature-item",
                        icon("check-circle", class = "feature-icon"),
                        span("Security Assessment & Auditing")
                    ),
                    div(class = "feature-item",
                        icon("check-circle", class = "feature-icon"),
                        span("Identity & Access Management")
                    ),
                    div(class = "feature-item",
                        icon("check-circle", class = "feature-icon"),
                        span("Network Security & Firewalls")
                    ),
                    div(class = "feature-item",
                        icon("check-circle", class = "feature-icon"),
                        span("Compliance & Risk Management")
                    )
                ),
                
                div(class = "service-tech",
                    span("OAuth 2.0", class = "tech-tag"),
                    span("JWT", class = "tech-tag"),
                    span("SSL/TLS", class = "tech-tag"),
                    span("Firewall", class = "tech-tag")
                ),
                
                div(class = "service-footer",
                    actionButton("learn_security", "Learn More", class = "btn btn-outline"),
                    actionButton("contact_security", "Get Quote", class = "btn btn-primary")
                )
            ),
            
            # Additional Services Card
            div(class = "service-card primary-service additional-services-card",
                div(class = "service-header",
                    div(class = "service-icon", icon("th")),
                    div(class = "service-badge", "More Services")
                ),
                h3("Additional Services"),
                p("Comprehensive technology solutions tailored to your business needs, from mobile development to digital transformation."),
                
                div(class = "additional-services-list",
                    div(class = "additional-service-item",
                        icon("mobile-alt", class = "item-icon"),
                        div(class = "item-content",
                            h5("Mobile Development"),
                            p("Native and cross-platform applications")
                        )
                    ),
                    div(class = "additional-service-item",
                        icon("database", class = "item-icon"),
                        div(class = "item-content",
                            h5("Database Management"),
                            p("Design, optimization, and migration")
                        )
                    ),
                    div(class = "additional-service-item",
                        icon("headset", class = "item-icon"),
                        div(class = "item-content",
                            h5("Technical Support"),
                            p("24/7 support and maintenance")
                        )
                    ),
                    div(class = "additional-service-item",
                        icon("graduation-cap", class = "item-icon"),
                        div(class = "item-content",
                            h5("Training & Consulting"),
                            p("Technology training and strategy")
                        )
                    ),
                    div(class = "additional-service-item",
                        icon("sync", class = "item-icon"),
                        div(class = "item-content",
                            h5("System Integration"),
                            p("Seamless integration solutions")
                        )
                    ),
                    div(class = "additional-service-item",
                        icon("rocket", class = "item-icon"),
                        div(class = "item-content",
                            h5("Digital Transformation"),
                            p("End-to-end transformation strategies")
                        )
                    )
                ),
                
                div(class = "service-footer",
                    actionButton("view_all_services", "View All Services", class = "btn btn-outline"),
                    actionButton("contact_services", "Get Started", class = "btn btn-primary")
                )
            )
          ),
          
          # Process Section - Interactive Roadmap
          div(
            class = "process-section",
            
            div(class = "process-background"),
            div(class = "process-container",
              div(class = "process-header",
                div(class = "process-badge",
                  icon("route", class = "badge-icon"),
                  span("Development Process")
                ),
                h2("Our Development Process", class = "process-title"),
                p("A systematic approach to delivering exceptional software solutions", class = "process-subtitle")
              ),
              
              # Interactive Roadmap
              div(class = "roadmap-container",
                # SVG Path for clean professional line
                tags$svg(class = "roadmap-path", viewBox = "0 0 400 2000", preserveAspectRatio = "none",
                  tags$path(class = "roadmap-line", d = "M 200 50 
                    Q 280 150 200 250
                    Q 120 350 200 450
                    Q 280 550 200 650
                    Q 120 750 200 850
                    Q 280 950 200 1050
                    Q 120 1150 200 1250
                    Q 280 1350 200 1450
                    Q 120 1550 200 1650
                    Q 280 1750 200 1850
                    L 200 1950", 
                    fill = "none", stroke = "rgba(5, 179, 5, 1)", "stroke-width" = "1")
                ),
                
                # Roadmap Steps
                div(class = "roadmap-steps",
                  # Step 1: Discovery
                  div(class = "roadmap-step", "data-step" = "1",
                    div(class = "step-marker",
                      div(class = "step-icon", icon("search")),
                      div(class = "step-pulse")
                    ),
                    div(class = "step-content",
                      div(class = "step-number", "01"),
                      h3("Discovery & Analysis", class = "step-title"),
                      p("We begin by understanding your business goals, technical requirements, and user needs through comprehensive research and stakeholder interviews.", class = "step-description")
                    )
                  ),
                  
                  # Step 2: Planning
                  div(class = "roadmap-step", "data-step" = "2",
                    div(class = "step-marker",
                      div(class = "step-icon", icon("project-diagram")),
                      div(class = "step-pulse")
                    ),
                    div(class = "step-content",
                      div(class = "step-number", "02"),
                      h3("Planning & Architecture", class = "step-title"),
                      p("Our team designs the technical architecture, creates detailed project plans, and establishes development milestones with clear deliverables.", class = "step-description")
                    )
                  ),
                  
                  # Step 3: Development
                  div(class = "roadmap-step", "data-step" = "3",
                    div(class = "step-marker",
                      div(class = "step-icon", icon("code")),
                      div(class = "step-pulse")
                    ),
                    div(class = "step-content",
                      div(class = "step-number", "03"),
                      h3("Development & Testing", class = "step-title"),
                      p("We build your solution using agile methodologies, with continuous testing, code reviews, and regular client feedback sessions.", class = "step-description")
                    )
                  ),
                  
                  # Step 4: Deployment
                  div(class = "roadmap-step", "data-step" = "4",
                    div(class = "step-marker",
                      div(class = "step-icon", icon("rocket")),
                      div(class = "step-pulse")
                    ),
                    div(class = "step-content",
                      div(class = "step-number", "04"),
                      h3("Deployment & Launch", class = "step-title"),
                      p("We handle the complete deployment process, including server setup, database migration, and go-live support to ensure smooth launch.", class = "step-description")
                    )
                  ),
                  
                  # Step 5: Support
                  div(class = "roadmap-step", "data-step" = "5",
                    div(class = "step-marker",
                      div(class = "step-icon", icon("headset")),
                      div(class = "step-pulse")
                    ),
                    div(class = "step-content",
                      div(class = "step-number", "05"),
                      h3("Support & Maintenance", class = "step-title"),
                      p("We provide ongoing support, monitoring, updates, and feature enhancements to ensure your solution continues to deliver value.", class = "step-description")
                    )
                  )
                )
              )
            )
          ),
          
        )
      ),
      
      # ===== SOLUTIONS SECTION =====
      tags$section(
        class = "solutions-section",
        id = "solutions",
        
        # Solutions Background Elements
        div(class = "solutions-background"),
        
        # Solutions Container
        div(
          class = "solutions-container",
          
          # Solutions Header
          div(
            class = "solutions-header",
            
            div(
              class = "solutions-badge",
              icon("cubes", class = "badge-icon"),
              span("Product Suites")
            ),
            
            h2(
              class = "solutions-title",
              "Industry Solutions",
              tags$br(),
              "Built for Africa"
            ),
            
            p(
              class = "solutions-subtitle",
              "Pre‑built, enterprise‑ready platforms that solve real problems across government, healthcare, education, and finance—secure, scalable, and locally optimized."
            )
          ),
          
          # Solutions Grid
          div(
            class = "solutions-grid",
            
            # FevaAI Platform
            div(class = "solution-card primary-solution",
                div(class = "solution-header",
                    div(class = "solution-icon", icon("robot")),
                    div(class = "solution-badge", "AI Platform")
                ),
                h3("FevaAI Platform"),
                p("No‑code and pro‑code AI platform for vision, NLP, and predictive analytics with strong MLOps."),
                
                div(class = "solution-highlights",
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("No‑code model builder")),
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("50+ African languages")),
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("On‑prem or cloud deployment"))
                ),
                
                div(class = "solution-tech",
                    span("TensorFlow", class = "tech-tag"),
                    span("PyTorch", class = "tech-tag"),
                    span("MLflow", class = "tech-tag"),
                    span("Kafka", class = "tech-tag")
                ),
                
                div(class = "solution-footer",
                    actionButton("demo_fevaai", "View Demo", class = "btn btn-primary"),
                    actionButton("contact_fevaai", "Get Started", class = "btn btn-outline")
                )
            ),
            
            # FevaChain (Coming Soon)
            div(class = "solution-card",
                div(class = "solution-header",
                    div(class = "solution-icon", icon("link")),
                    div(class = "solution-badge", "Blockchain")
                ),
                h3("FevaChain"),
                p("Sovereign blockchain for digital identity, verifiable credentials, and secure payments across borders."),
                
                div(class = "solution-highlights",
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("Self‑sovereign identity")),
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("Instant cross‑border settlement")),
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("Smart contracts & compliance"))
                ),
                
                div(class = "solution-tech",
                    span("Ethereum", class = "tech-tag"),
                    span("Polygon", class = "tech-tag"),
                    span("Hyperledger", class = "tech-tag")
                ),
                
                div(class = "solution-footer",
                    actionButton("notify_fevachain", "Get Notified", class = "btn btn-secondary"),
                    actionButton("learn_more_chain", "Learn More", class = "btn btn-outline")
                )
            ),
            
            # FevaHealth (Coming Soon)
            div(class = "solution-card",
                div(class = "solution-header",
                    div(class = "solution-icon", icon("hospital")),
                    div(class = "solution-badge", "HealthTech")
                ),
                h3("FevaHealth"),
                p("Interoperable digital health platform: EMR, telemedicine, e‑pharmacy, and AI triage integrated."),
                
                div(class = "solution-highlights",
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("HL7/FHIR compliant")),
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("Offline‑first clinics")),
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("AI decision support"))
                ),
                
                div(class = "solution-tech",
                    span("FHIR", class = "tech-tag"),
                    span("Keycloak", class = "tech-tag"),
                    span("PostgreSQL", class = "tech-tag")
                ),
                
                div(class = "solution-footer",
                    actionButton("notify_fevahealth", "Get Notified", class = "btn btn-secondary"),
                    actionButton("learn_more_health", "Learn More", class = "btn btn-outline")
                )
            ),
            
            # FevaEdu
            div(class = "solution-card",
                div(class = "solution-header",
                    div(class = "solution-icon", icon("graduation-cap")),
                    div(class = "solution-badge", "EdTech")
                ),
                h3("FevaEdu"),
                p("Learning platform with adaptive AI, assessments, and offline‑capable classrooms for schools and universities."),
                
                div(class = "solution-highlights",
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("Adaptive learning")),
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("Analytics & reporting")),
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("Multi‑tenant SaaS"))
                ),
                
                div(class = "solution-tech",
                    span("React", class = "tech-tag"),
                    span("Node.js", class = "tech-tag"),
                    span("Redis", class = "tech-tag")
                ),
                
                div(class = "solution-footer",
                    actionButton("contact_fevaedu", "Request Demo", class = "btn btn-primary"),
                    actionButton("learn_more_edu", "Learn More", class = "btn btn-outline")
                )
            )
          ),
          
        )
      ),
  
  # ===== PORTFOLIO SECTION =====
  tags$section(
    class = "portfolio-section",
    id = "portfolio",
    
    div(class = "portfolio-background"),
    
    div(class = "portfolio-container",
        div(class = "portfolio-header",
            div(class = "portfolio-badge", icon("briefcase", class = "badge-icon"), span("Case Studies")),
            h2(class = "portfolio-title", "Proven Impact", tags$br(), "Across Industries"),
            p(class = "portfolio-subtitle", "A selection of outcome‑driven projects delivered with reliability, scale, and security.")
        ),
        
        # Filters
        div(class = "portfolio-filters",
            actionButton("filter_all", "All", class = "btn btn-secondary active"),
            actionButton("filter_government", "Government", class = "btn btn-outline"),
            actionButton("filter_healthcare", "Healthcare", class = "btn btn-outline"),
            actionButton("filter_education", "Education", class = "btn btn-outline"),
            actionButton("filter_fintech", "Finance", class = "btn btn-outline"),
            actionButton("filter_enterprise", "Enterprise", class = "btn btn-outline")
        ),
        
        # Portfolio Grid
        div(class = "portfolio-grid",
            div(class = "portfolio-card government",
                div(class = "card-media",
                    img(src = "image1.jpg", alt = "Digital ID Platform", class = "card-image"),
                    div(class = "media-overlay", span("Government"))
                ),
                div(class = "card-body",
                    h3("Rwanda Digital ID Platform"),
                    p("Nationwide digital identity with biometric security and fraud detection."),
                    div(class = "card-meta",
                        span("2M+ Users", class = "meta-tag"),
                        span("95% Fraud Reduction", class = "meta-tag")
                    ),
                    actionButton("view_case_study", "View Case Study", class = "btn btn-primary")
                )
            ),
            
            div(class = "portfolio-card healthcare",
                div(class = "card-media",
                    img(src = "image2.jpg", alt = "Telemedicine Network", class = "card-image"),
                    div(class = "media-overlay", span("Healthcare"))
                ),
                div(class = "card-body",
                    h3("Regional Telemedicine Network"),
                    p("Connected clinics with AI triage and offline‑first EMR syncing."),
                    div(class = "card-meta",
                        span("120+ Clinics", class = "meta-tag"),
                        span("< 200ms Latency", class = "meta-tag")
                    ),
                    actionButton("view_case_study_health", "View Case Study", class = "btn btn-outline")
                )
            ),
            
            div(class = "portfolio-card fintech",
                div(class = "card-media",
                    img(src = "image3.jpg", alt = "Open Banking APIs", class = "card-image"),
                    div(class = "media-overlay", span("Finance"))
                ),
                div(class = "card-body",
                    h3("Open Banking Initiative"),
                    p("API gateway enabling secure integrations with banks and fintech partners."),
                    div(class = "card-meta",
                        span("PSDs2 Ready", class = "meta-tag"),
                        span("5M+ tx/mo", class = "meta-tag")
                    ),
                    actionButton("view_case_study_fin", "View Case Study", class = "btn btn-outline")
                )
            )
        )
    )
  ),
  
  # ===== TEAM SECTION =====
  tags$section(
    class = "team-section",
    id = "team",
    
    div(class = "team-background"),
    
    div(class = "team-container",
        div(class = "team-header",
            div(class = "team-badge", icon("users", class = "badge-icon"), span("Leadership")),
            h2(class = "team-title", "People Who Build", tags$br(), "Reliable Technology"),
            p(class = "team-subtitle", "Experienced engineers, designers, and product leaders with a track record of delivery.")
        ),
        
        div(class = "team-grid",
            div(class = "member-card",
                div(class = "member-avatar placeholder", icon("user-tie")),
                h3("A. N. Executive"),
                span("Chief Executive Officer", class = "member-role"),
                div(class = "member-tags",
                    span("Strategy", class = "tag"), span("Partnerships", class = "tag"), span("Growth", class = "tag")
                )
            ),
            div(class = "member-card",
                div(class = "member-avatar placeholder", icon("microchip")),
                h3("B. T. Engineer"),
                span("Chief Technology Officer", class = "member-role"),
                div(class = "member-tags",
                    span("Architecture", class = "tag"), span("Security", class = "tag"), span("Scale", class = "tag")
                )
            ),
            div(class = "member-card",
                div(class = "member-avatar placeholder", icon("paint-brush")),
                h3("C. U. Designer"),
                span("Head of Design", class = "member-role"),
                div(class = "member-tags",
                    span("Design Systems", class = "tag"), span("UX", class = "tag"), span("Accessibility", class = "tag")
                )
            ),
            div(class = "member-card",
                div(class = "member-avatar placeholder", icon("shield-alt")),
                h3("D. V. SecOps"),
                span("Head of Security", class = "member-role"),
                div(class = "member-tags",
                    span("Compliance", class = "tag"), span("IAM", class = "tag"), span("DevSecOps", class = "tag")
                )
            )
        )
    )
  ),
  
  # ===== CONTACT SECTION =====
  tags$section(
    class = "contact-section",
    id = "contact",
    
    div(class = "contact-background"),
    
    div(class = "contact-container",
        div(class = "contact-header",
            div(class = "contact-badge", icon("envelope", class = "badge-icon"), span("Contact Us")),
            h2(class = "contact-title", "Tell Us About", tags$br(), "Your Project"),
            p(class = "contact-subtitle", "We respond within 24 hours. Your information is kept confidential and secure.")
        ),
        
        div(class = "contact-content",
            div(class = "contact-card form-card",
                div(class = "form-row",
                    textInput("contact_name", label = "Full Name", value = ""),
                    textInput("contact_email", label = "Work Email", value = "")
                ),
                div(class = "form-row",
                    textInput("contact_company", label = "Company / Organization", value = ""),
                    selectInput("contact_industry", label = "Industry", choices = c("Government","Healthcare","Education","Finance","Enterprise","Other"))
                ),
                div(class = "form-row",
                    selectInput("contact_budget", label = "Estimated Budget", choices = c("< $10k","$10k - $50k","$50k - $200k","$200k+")),
                    selectInput("contact_timeline", label = "Timeline", choices = c("ASAP","1-3 months","3-6 months","6+ months"))
                ),
                textAreaInput("project_description", label = "Project Description", value = "", rows = 4, placeholder = "What are you trying to build? Key goals, constraints, integrations, users..."),
                div(class = "form-actions",
                    actionButton("submit_project", "Submit Project", class = "btn btn-primary"),
                    actionButton("schedule_meeting", "Schedule a Meeting", class = "btn btn-secondary")
                )
            ),
            
            div(class = "contact-card info-card",
                h3("How to Reach Us"),
                div(class = "info-list",
                    div(class = "info-item", icon("envelope"), span("hello@feva.africa")),
                    div(class = "info-item", icon("phone"), span("+250 788 123 456")),
                    div(class = "info-item", icon("map-marker-alt"), span("Kigali Innovation City, Rwanda"))
                ),
                h3("Why Work With Us"),
                div(class = "value-list",
                    div(class = "value-item", icon("check-circle"), span("Enterprise security & compliance")),
                    div(class = "value-item", icon("check-circle"), span("Scalable cloud architecture")),
                    div(class = "value-item", icon("check-circle"), span("Local expertise across Africa"))
                )
            )
        )
    )
  ),
      
      
    ),
    
    # ===== FOOTER =====
    tags$footer(
      class = "site-footer",
      id = "site-footer",
      
      # Main Footer Content
      div(
        class = "footer-main",
        
        div(class = "footer-container",
            
            # Footer Brand Section
            div(class = "footer-brand",
                div(class = "footer-logo",
                    img(src = "Feva.png", alt = "Feva Logo", class = "footer-logo-img")
                ),
                
                p(class = "footer-description",
                  "Transforming Africa through intelligent technology solutions. We build the future, one innovation at a time."
                ),
                
                div(class = "footer-social",
                    h4("Connect With Us"),
                    div(class = "social-links",
                        a(href = "#", icon("linkedin"), class = "social-link"),
                        a(href = "#", icon("twitter"), class = "social-link"),
                        a(href = "#", icon("github"), class = "social-link"),
                        a(href = "#", icon("youtube"), class = "social-link"),
                        a(href = "#", icon("instagram"), class = "social-link")
                    )
                )
            ),
            
            # Footer Links Grid
            div(class = "footer-links-grid",
                
                # Services Column
                div(class = "footer-column",
                    h4("Services"),
                    tags$ul(class = "footer-links",
                            tags$li(a(href = "#services", "AI & Machine Learning")),
                            tags$li(a(href = "#services", "Blockchain Solutions")),
                            tags$li(a(href = "#services", "Cloud Infrastructure")),
                            tags$li(a(href = "#services", "Mobile Development")),
                            tags$li(a(href = "#services", "Data Analytics")),
                            tags$li(a(href = "#services", "Cybersecurity"))
                    )
                ),
                
                # Solutions Column
                div(class = "footer-column",
                    h4("Solutions"),
                    tags$ul(class = "footer-links",
                            tags$li(a(href = "#solutions", "FevaAI Platform")),
                            tags$li(a(href = "#solutions", "FevaChain")),
                            tags$li(a(href = "#solutions", "FevaHealth")),
                            tags$li(a(href = "#solutions", "FevaEdu")),
                            tags$li(a(href = "#contact", "Custom Solutions"))
                    )
                ),
                
                # Company Column
                div(class = "footer-column",
                    h4("Company"),
                    tags$ul(class = "footer-links",
                            tags$li(a(href = "#about", "About Us")),
                            tags$li(a(href = "#team", "Our Team")),
                            tags$li(a(href = "#", "Careers")),
                            tags$li(a(href = "#", "Press & Media")),
                            tags$li(a(href = "#", "Blog")),
                            tags$li(a(href = "#contact", "Contact"))
                    )
                ),
                
                # Resources Column
                div(class = "footer-column",
                    h4("Resources"),
                    tags$ul(class = "footer-links",
                            tags$li(a(href = "#", "Documentation")),
                            tags$li(a(href = "#", "API Reference")),
                            tags$li(a(href = "#portfolio", "Case Studies")),
                            tags$li(a(href = "#", "White Papers")),
                            tags$li(a(href = "#", "Support Center")),
                            tags$li(a(href = "#", "Community"))
                    )
                )
            ),
            
            # Newsletter Signup
            div(class = "footer-newsletter",
                h4("Stay Updated"),
                p("Get the latest insights on African tech innovation and our company updates."),
                
                div(class = "newsletter-form",
                    textInput("newsletter_email",label = " ", placeholder = "Enter your email", value = ""),
                    actionButton("newsletter_subscribe", "Subscribe", class = "btn btn-primary")
                ),
                
                div(class = "newsletter-privacy",
                    p("By subscribing, you agree to our Privacy Policy and Terms of Service.")
                )
            )
        )
      ),
      
      # Footer Bottom
      div(
        class = "footer-bottom",
        
        div(class = "footer-bottom-container",
            div(class = "footer-bottom-left",
                p("© 2025 Feva Technologies. All rights reserved."),
                
                div(class = "footer-certifications",
                    div(class = "cert-badge", "ISO 27001"),
                    div(class = "cert-badge", "SOC 2"),
                    div(class = "cert-badge", "GDPR Compliant")
                )
            ),
            
            div(class = "footer-bottom-right",
                a(href = "#", "Privacy Policy"),
                a(href = "#", "Terms of Service"),
                a(href = "#", "Cookie Policy"),
                a(href = "#", "Accessibility")
            )
        )
      )
    )
  ),
  
  # ===== END OF CONTACT SECTION =====
  
 
)

# ================================================================
# SERVER LOGIC - PROFESSIONAL FUNCTIONALITY
# ================================================================

server <- function(input, output, session) {
  
  # ===== INITIALIZATION =====
  
  # Hide loading screen after app loads
  waiter_hide()
  
  # Initialize reactive values
  values <- reactiveValues(
    form_step = 1,
    theme = "light",
    mobile_menu_open = FALSE,
    testimonial_index = 1
  )
  
  # ===== NAVIGATION HANDLERS =====
  
  # Theme toggle functionality
  observeEvent(input$theme_toggle, {
    values$theme <- ifelse(values$theme == "light", "dark", "light")
    runjs(paste0("toggleTheme('", values$theme, "');"))
  })
  
  # Mobile menu toggle
  observeEvent(input$mobile_menu_toggle, {
    values$mobile_menu_open <- !values$mobile_menu_open
    runjs(paste0("toggleMobileMenu(", tolower(values$mobile_menu_open), ");"))
  })
  
  # Smooth scrolling for navigation
  observeEvent(input$header_cta, {
    runjs("smoothScrollTo('#contact');")
  })
  
  # ===== HERO SECTION HANDLERS =====
  
  
  
  observeEvent(input$hero_explore, {
    runjs("smoothScrollTo('#services');")
    runjs("animateServiceCards();")
  })
  
  
  # ===== SERVICE SECTION HANDLERS =====
  
  # Service modal handlers
  observeEvent(input$learn_ai, {
    showModal(
      modalDialog(
        title = "AI & Machine Learning Solutions",
        size = "l",
        easyClose = TRUE,
        
        div(class = "service-modal-content",
            div(class = "service-modal-header",
                div(class = "service-modal-icon", icon("brain")),
                h3("Artificial Intelligence & Machine Learning")
            ),
            
            div(class = "service-modal-body",
                p("Our AI/ML solutions leverage cutting-edge algorithms and frameworks to solve complex business challenges and drive innovation."),
                
                div(class = "service-details-grid",
                    div(class = "detail-section",
                        h4("Key Features"),
                        tags$ul(
                          tags$li("Custom machine learning model development"),
                          tags$li("Natural language processing and understanding"),
                          tags$li("Computer vision and image recognition"),
                          tags$li("Predictive analytics and forecasting"),
                          tags$li("Deep learning implementations"),
                          tags$li("AI model deployment and monitoring")
                        )
                    ),
                    
                    div(class = "detail-section",
                        h4("Technologies"),
                        div(class = "tech-badges",
                            span("TensorFlow", class = "tech-badge"),
                            span("PyTorch", class = "tech-badge"),
                            span("Scikit-learn", class = "tech-badge"),
                            span("OpenAI", class = "tech-badge"),
                            span("Hugging Face", class = "tech-badge"),
                            span("MLflow", class = "tech-badge")
                        )
                    ),
                    
                    div(class = "detail-section",
                        h4("Use Cases"),
                        tags$ul(
                          tags$li("Healthcare diagnosis and treatment optimization"),
                          tags$li("Financial fraud detection and risk assessment"),
                          tags$li("Agricultural crop monitoring and yield prediction"),
                          tags$li("Educational content personalization"),
                          tags$li("Supply chain optimization")
                        )
                    )
                )
            )
        ),
        
        footer = div(
          actionButton("contact_ai", "Get Started", class = "btn btn-primary"),
          actionButton("close_service_modal", "Close", class = "btn btn-secondary")
        )
      )
    )
  })
  
  # Similar handlers for other services (blockchain, cloud, etc.)
  observeEvent(input$learn_blockchain, {
    showModal(
      modalDialog(
        title = "Blockchain Solutions",
        size = "l",
        easyClose = TRUE,
        
        div(class = "service-modal-content",
            div(class = "service-modal-header",
                div(class = "service-modal-icon", icon("link")),
                h3("Blockchain & Web3 Solutions")
            ),
            
            div(class = "service-modal-body",
                p("Build secure, transparent, and decentralized applications with our comprehensive blockchain expertise."),
                
                div(class = "service-details-grid",
                    div(class = "detail-section",
                        h4("Our Services"),
                        tags$ul(
                          tags$li("Smart contract development and auditing"),
                          tags$li("DeFi platform creation and optimization"),
                          tags$li("NFT marketplace development"),
                          tags$li("Cryptocurrency and token solutions"),
                          tags$li("Blockchain integration and consulting")
                        )
                    ),
                    
                    div(class = "detail-section",
                        h4("Platforms"),
                        div(class = "tech-badges",
                            span("Ethereum", class = "tech-badge"),
                            span("Binance Smart Chain", class = "tech-badge"),
                            span("Polygon", class = "tech-badge"),
                            span("Solana", class = "tech-badge"),
                            span("Hyperledger", class = "tech-badge")
                        )
                    )
                )
            )
        ),
        
        footer = div(
          actionButton("contact_blockchain", "Get Started", class = "btn btn-primary"),
          actionButton("close_service_modal", "Close", class = "btn btn-secondary")
        )
      )
    )
  })
  
  # ===== PORTFOLIO SECTION HANDLERS =====
  
  # Portfolio filtering
  observeEvent(input$filter_all, {
    runjs("filterPortfolioItems('all');")
    runjs("updateFilterButtons('all');")
  })
  
  observeEvent(input$filter_government, {
    runjs("filterPortfolioItems('government');")
    runjs("updateFilterButtons('government');")
  })
  
  observeEvent(input$filter_healthcare, {
    runjs("filterPortfolioItems('healthcare');")
    runjs("updateFilterButtons('healthcare');")
  })
  
  observeEvent(input$filter_education, {
    runjs("filterPortfolioItems('education');")
    runjs("updateFilterButtons('education');")
  })
  
  observeEvent(input$filter_fintech, {
    runjs("filterPortfolioItems('fintech');")
    runjs("updateFilterButtons('fintech');")
  })
  
  observeEvent(input$filter_enterprise, {
    runjs("filterPortfolioItems('enterprise');")
    runjs("updateFilterButtons('enterprise');")
  })
  
  # Project case study handlers
  observeEvent(input$view_case_study, {
    showModal(
      modalDialog(
        title = "Case Study: Rwanda Digital ID Platform",
        size = "l",
        easyClose = TRUE,
        
        div(class = "case-study-modal",
            div(class = "case-study-header",
                img(src = "assets/case-studies/rwanda-digital-id.jpg", alt = "Rwanda Digital ID", class = "case-study-image"),
                
                div(class = "case-study-meta",
                    div(class = "project-tags",
                        span("Government", class = "project-tag government"),
                        span("AI-Powered", class = "project-tag ai"),
                        span("Award Winner", class = "project-tag award")
                    ),
                    
                    h3("Rwanda Digital ID Platform"),
                    p("Transforming citizen services through secure digital identity")
                )
            ),
            
            div(class = "case-study-content",
                div(class = "challenge-section",
                    h4("The Challenge"),
                    p("Rwanda needed a secure, scalable digital identity system to serve 12+ million citizens while preventing fraud and ensuring privacy.")
                ),
                
                div(class = "solution-section",
                    h4("Our Solution"),
                    p("We developed a comprehensive platform combining biometric authentication, blockchain security, and AI-powered fraud detection.")
                ),
                
                div(class = "results-section",
                    h4("Results"),
                    div(class = "results-grid",
                        div(class = "result-item",
                            span("2M+", class = "result-number"),
                            span("Citizens Registered", class = "result-label")
                        ),
                        div(class = "result-item",
                            span("95%", class = "result-number"),
                            span("Fraud Reduction", class = "result-label")
                        ),
                        div(class = "result-item",
                            span("90%", class = "result-number"),
                            span("Faster Processing", class = "result-label")
                        ),
                        div(class = "result-item",
                            span("$5M", class = "result-number"),
                            span("Cost Savings", class = "result-label")
                        )
                    )
                )
            )
        ),
        
        footer = div(
          actionButton("download_case_study", "Download Full Case Study", class = "btn btn-primary"),
          actionButton("close_case_study", "Close", class = "btn btn-secondary")
        )
      )
    )
  })
  
  # ===== TEAM SECTION HANDLERS =====
  
  observeEvent(input$view_careers, {
    showModal(
      modalDialog(
        title = "Join Our Team",
        size = "l",
        easyClose = TRUE,
        
        div(class = "careers-modal-content",
            div(class = "careers-header",
                h3("Open Positions"),
                p("Join our mission to transform Africa through technology")
            ),
            
            div(class = "job-listings",
                div(class = "job-item",
                    div(class = "job-header",
                        h4("Senior AI Engineer"),
                        div(class = "job-meta",
                            span("Remote/Kigali", class = "job-location"),
                            span("Full-time", class = "job-type"),
                            span("$80k-120k", class = "job-salary")
                        )
                    ),
                    p("Lead AI/ML projects and mentor junior developers in our growing team."),
                    
                    div(class = "job-skills",
                        span("Python", class = "skill-tag"),
                        span("TensorFlow", class = "skill-tag"),
                        span("MLOps", class = "skill-tag")
                    )
                ),
                
                div(class = "job-item",
                    div(class = "job-header",
                        h4("Product Designer"),
                        div(class = "job-meta",
                            span("Kigali", class = "job-location"),
                            span("Full-time", class = "job-type"),
                            span("$60k-90k", class = "job-salary")
                        )
                    ),
                    p("Design user-centric experiences for our innovative platforms."),
                    
                    div(class = "job-skills",
                        span("Figma", class = "skill-tag"),
                        span("Design Systems", class = "skill-tag"),
                        span("User Research", class = "skill-tag")
                    )
                ),
                
                div(class = "job-item",
                    div(class = "job-header",
                        h4("DevOps Engineer"),
                        div(class = "job-meta",
                            span("Remote", class = "job-location"),
                            span("Full-time", class = "job-type"),
                            span("$70k-100k", class = "job-salary")
                        )
                    ),
                    p("Build and maintain our cloud infrastructure and deployment pipelines."),
                    
                    div(class = "job-skills",
                        span("AWS", class = "skill-tag"),
                        span("Kubernetes", class = "skill-tag"),
                        span("CI/CD", class = "skill-tag")
                    )
                )
            )
        ),
        
        footer = div(
          actionButton("apply_now", "Apply Now", class = "btn btn-primary"),
          actionButton("close_careers", "Close", class = "btn btn-secondary")
        )
      )
    )
  })
  
  # ===== CONTACT FORM HANDLERS =====
  
  # Multi-step form navigation
  observeEvent(input$next_step_1, {
    if (input$contact_name != "" && input$contact_email != "") {
      values$form_step <- 2
      runjs("showFormStep(2);")
    } else {
      showNotification("Please fill in all required fields", type = "error")
    }
  })
  
  observeEvent(input$next_step_2, {
    values$form_step <- 3
    runjs("showFormStep(3);")
  })
  
  observeEvent(input$prev_step_2, {
    values$form_step <- 1
    runjs("showFormStep(1);")
  })
  
  observeEvent(input$prev_step_3, {
    values$form_step <- 2
    runjs("showFormStep(2);")
  })
  
  # Form submission
  observeEvent(input$submit_project, {
    req(input$contact_name, input$contact_email, input$project_description, input$terms_agreement)
    
    if (!input$terms_agreement) {
      showNotification("Please agree to the Terms of Service and Privacy Policy", type = "error")
      return()
    }
    
    # Simulate form submission
    runjs("showLoadingState();")
    
    # Simulate API call delay
    Sys.sleep(2)
    
    showNotification(
      paste0("Thank you ", input$contact_name, "! Your project has been submitted successfully. Our team will review it and get back to you within 24 hours."),
      type = "message",
      duration = 8
    )
    
    # Reset form
    values$form_step <- 1
    runjs("resetContactForm();")
    runjs("hideLoadingState();")
  })
  
  # ===== UTILITY HANDLERS =====
  
  # Newsletter subscription
  observeEvent(input$newsletter_subscribe, {
    req(input$newsletter_email)
    
    if (!grepl("^[\\w\\.-]+@[\\w\\.-]+\\.[a-zA-Z]{2,}$", input$newsletter_email)) {
      showNotification("Please enter a valid email address", type = "error")
      return()
    }
    
    showNotification("Thank you for subscribing to our newsletter!", type = "message", duration = 5)
    updateTextInput(session, "newsletter_email", value = "")
  })
  
  
  
  # Contact method handlers
  observeEvent(input$email_contact, {
    runjs("window.location.href = 'mailto:hello@feva.africa?subject=Project Inquiry';")
  })
  
  observeEvent(input$phone_contact, {
    runjs("window.location.href = 'tel:+250788123456';")
  })
  
  observeEvent(input$office_visit, {
    runjs("window.open('https://maps.google.com/?q=Kigali Innovation City', '_blank');")
  })
  
  observeEvent(input$schedule_meeting, {
    runjs("window.open('https://calendly.com/feva-team/consultation', '_blank');")
  })
  
  # ===== MODAL CLOSE HANDLERS =====
  
  observeEvent(input$close_demo_modal, { removeModal() })
  observeEvent(input$close_service_modal, { removeModal() })
  observeEvent(input$close_case_study, { removeModal() })
  observeEvent(input$close_careers, { removeModal() })
  observeEvent(input$close_cookie_modal, { removeModal() })
  
  # ===== ANALYTICS AND TRACKING =====
  
  # Track page interactions
  observe({
    # Track user engagement metrics
    runjs("trackPageInteraction();")
  })
  
  # Performance monitoring
  observe({
    invalidateLater(60000) # Check every minute
    runjs("
      if (typeof performance !== 'undefined' && performance.timing) {
        const loadTime = performance.timing.loadEventEnd - performance.timing.navigationStart;
        console.log('Page load time:', loadTime + 'ms');
      }
    ")
  })
  
  # Real-time notifications system
  observe({
    invalidateLater(30000) # Check every 30 seconds
    
    # Simulate real-time updates (replace with actual API calls)
    if (sample(c(TRUE, FALSE), 1, prob = c(0.1, 0.9))) {
      notifications <- c(
        "New case study published: 'AI in African Healthcare'",
        "FevaAI platform update: Enhanced natural language processing",
        "Join our upcoming webinar: 'Blockchain for Social Impact'",
        "New partnership announced with leading African university"
      )
      
      # ===== SOLUTIONS SECTION =====
      tags$section(
        class = "solutions-section",
        id = "solutions",
        
        # Solutions Background Elements
        div(class = "solutions-background"),
        
        # Solutions Container
        div(
          class = "solutions-container",
          
          # Solutions Header
          div(
            class = "solutions-header",
            
            div(
              class = "solutions-badge",
              icon("cubes", class = "badge-icon"),
              span("Product Suites")
            ),
            
            h2(
              class = "solutions-title",
              "Industry Solutions",
              tags$br(),
              "Built for Africa"
            ),
            
            p(
              class = "solutions-subtitle",
              "Pre‑built, enterprise‑ready platforms that solve real problems across government, healthcare, education, and finance—secure, scalable, and locally optimized."
            )
          ),
          
          # Solutions Grid
          div(
            class = "solutions-grid",
            
            # FevaAI Platform
            div(class = "solution-card primary-solution",
                div(class = "solution-header",
                    div(class = "solution-icon", icon("robot")),
                    div(class = "solution-badge", "AI Platform")
                ),
                h3("FevaAI Platform"),
                p("No‑code and pro‑code AI platform for vision, NLP, and predictive analytics with strong MLOps."),
                
                div(class = "solution-highlights",
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("No‑code model builder")),
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("50+ African languages")),
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("On‑prem or cloud deployment"))
                ),
                
                div(class = "solution-tech",
                    span("TensorFlow", class = "tech-tag"),
                    span("PyTorch", class = "tech-tag"),
                    span("MLflow", class = "tech-tag"),
                    span("Kafka", class = "tech-tag")
                ),
                
                div(class = "solution-footer",
                    actionButton("demo_fevaai", "View Demo", class = "btn btn-primary"),
                    actionButton("contact_fevaai", "Get Started", class = "btn btn-outline")
                )
            ),
            
            # FevaChain (Coming Soon)
            div(class = "solution-card",
                div(class = "solution-header",
                    div(class = "solution-icon", icon("link")),
                    div(class = "solution-badge", "Blockchain")
                ),
                h3("FevaChain"),
                p("Sovereign blockchain for digital identity, verifiable credentials, and secure payments across borders."),
                
                div(class = "solution-highlights",
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("Self‑sovereign identity")),
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("Instant cross‑border settlement")),
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("Smart contracts & compliance"))
                ),
                
                div(class = "solution-tech",
                    span("Ethereum", class = "tech-tag"),
                    span("Polygon", class = "tech-tag"),
                    span("Hyperledger", class = "tech-tag")
                ),
                
                div(class = "solution-footer",
                    actionButton("notify_fevachain", "Get Notified", class = "btn btn-secondary"),
                    actionButton("learn_more_chain", "Learn More", class = "btn btn-outline")
                )
            ),
            
            # FevaHealth (Coming Soon)
            div(class = "solution-card",
                div(class = "solution-header",
                    div(class = "solution-icon", icon("hospital")),
                    div(class = "solution-badge", "HealthTech")
                ),
                h3("FevaHealth"),
                p("Interoperable digital health platform: EMR, telemedicine, e‑pharmacy, and AI triage integrated."),
                
                div(class = "solution-highlights",
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("HL7/FHIR compliant")),
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("Offline‑first clinics")),
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("AI decision support"))
                ),
                
                div(class = "solution-tech",
                    span("FHIR", class = "tech-tag"),
                    span("Keycloak", class = "tech-tag"),
                    span("PostgreSQL", class = "tech-tag")
                ),
                
                div(class = "solution-footer",
                    actionButton("notify_fevahealth", "Get Notified", class = "btn btn-secondary"),
                    actionButton("learn_more_health", "Learn More", class = "btn btn-outline")
                )
            ),
            
            # FevaEdu
            div(class = "solution-card",
                div(class = "solution-header",
                    div(class = "solution-icon", icon("graduation-cap")),
                    div(class = "solution-badge", "EdTech")
                ),
                h3("FevaEdu"),
                p("Learning platform with adaptive AI, assessments, and offline‑capable classrooms for schools and universities."),
                
                div(class = "solution-highlights",
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("Adaptive learning")),
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("Analytics & reporting")),
                    div(class = "highlight-item", icon("check-circle", class = "highlight-icon"), span("Multi‑tenant SaaS"))
                ),
                
                div(class = "solution-tech",
                    span("React", class = "tech-tag"),
                    span("Node.js", class = "tech-tag"),
                    span("Redis", class = "tech-tag")
                ),
                
                div(class = "solution-footer",
                    actionButton("contact_fevaedu", "Request Demo", class = "btn btn-primary"),
                    actionButton("learn_more_edu", "Learn More", class = "btn btn-outline")
                )
            )
          ),
          
        )
      )
      
      showNotification(
        sample(notifications, 1),
        type = "message",
        duration = 5
      )
    }
  })
  
  # ===== SOLUTION DEMO HANDLERS =====
  
  observeEvent(input$demo_fevaai, {
    showModal(
      modalDialog(
        title = "FevaAI Platform Demo",
        size = "xl",
        easyClose = TRUE,
        
        div(class = "solution-demo-modal",
            div(class = "demo-header",
                div(class = "demo-logo",
                    img(src = "assets/solutions/fevaai-logo.svg", alt = "FevaAI", class = "demo-logo-img")
                ),
                h3("FevaAI Interactive Demo"),
                p("Experience the power of AI democratization firsthand")
            ),
            
            div(class = "demo-content",
                div(class = "demo-preview",
                    # Placeholder for interactive demo
                    div(class = "demo-interface",
                        div(class = "demo-sidebar",
                            h4("AI Models"),
                            div(class = "model-list",
                                div(class = "model-item active", "Text Analysis"),
                                div(class = "model-item", "Image Recognition"),
                                div(class = "model-item", "Predictive Analytics"),
                                div(class = "model-item", "Natural Language")
                            )
                        ),
                        
                        div(class = "demo-main",
                            div(class = "demo-input",
                                h4("Try Text Analysis"),
                                textAreaInput("demo_text", label = "",
                                              placeholder = "Enter text to analyze sentiment, extract keywords, or detect language...",
                                              value = "",
                                              rows = 4),
                                actionButton("analyze_demo", "Analyze", class = "btn btn-primary")
                            ),
                            
                            div(class = "demo-output",
                                h4("Results"),
                                div(class = "results-placeholder",
                                    div(class = "result-item",
                                        span("Sentiment:", class = "result-label"),
                                        span("Positive (87%)", class = "result-value positive")
                                    ),
                                    div(class = "result-item",
                                        span("Language:", class = "result-label"),
                                        span("English", class = "result-value")
                                    ),
                                    div(class = "result-item",
                                        span("Keywords:", class = "result-label"),
                                        span("technology, innovation, Africa", class = "result-value")
                                    )
                                )
                            )
                        )
                    )
                ),
                
                div(class = "demo-features",
                    h4("Key Features"),
                    div(class = "feature-grid",
                        div(class = "feature-demo",
                            icon("magic", class = "feature-icon"),
                            h5("No-Code AI"),
                            p("Build and deploy AI models without programming")
                        ),
                        div(class = "feature-demo",
                            icon("globe-africa", class = "feature-icon"),
                            h5("African Languages"),
                            p("Support for 50+ African languages")
                        ),
                        div(class = "feature-demo",
                            icon("mobile", class = "feature-icon"),
                            h5("Mobile-First"),
                            p("Optimized for mobile devices")
                        ),
                        div(class = "feature-demo",
                            icon("shield", class = "feature-icon"),
                            h5("Enterprise Security"),
                            p("Bank-grade security and compliance")
                        )
                    )
                )
            )
        ),
        
        footer = div(
          actionButton("request_full_demo", "Request Full Demo", class = "btn btn-primary"),
          actionButton("start_trial", "Start Free Trial", class = "btn btn-secondary"),
          actionButton("close_demo", "Close", class = "btn btn-outline")
        )
      )
    )
  })
  
  # Demo interaction handlers
  observeEvent(input$analyze_demo, {
    req(input$demo_text)
    
    # Simulate AI analysis
    runjs("showDemoProcessing();")
    
    Sys.sleep(1) # Simulate processing time
    
    # Update demo results
    runjs("updateDemoResults();")
    showNotification("Analysis complete! This is a demonstration of FevaAI's capabilities.", type = "message", duration = 3)
  })
  
  observeEvent(input$request_full_demo, {
    removeModal()
    runjs("smoothScrollTo('#contact');")
    showNotification("Please fill out the contact form to schedule a personalized demo!", type = "message", duration = 5)
  })
  
  observeEvent(input$start_trial, {
    runjs("window.open('https://app.fevaai.com/signup', '_blank');")
  })
  
  # ===== ADDITIONAL SOLUTION HANDLERS =====
  
  # Coming soon notification handlers
  observeEvent(input$notify_fevachain, {
    showModal(
      modalDialog(
        title = "FevaChain - Coming Soon",
        size = "m",
        easyClose = TRUE,
        
        div(class = "coming-soon-modal",
            div(class = "solution-preview",
                img(src = "assets/solutions/fevachain-preview.png", alt = "FevaChain", class = "solution-preview-img"),
                div(class = "solution-badge", "Blockchain")
            ),
            
            div(class = "solution-details",
                h3("FevaChain"),
                p("Revolutionary blockchain infrastructure for secure digital identity and payments across Africa."),
                
                div(class = "launch-timeline",
                    h4("Expected Launch: Q3 2025"),
                    div(class = "timeline-progress",
                        div(class = "progress-bar", style = "width: 65%"),
                        span("65% Complete", class = "progress-text")
                    )
                ),
                
                div(class = "notify-form",
                    h4("Get Notified"),
                    p("Be the first to know when FevaChain launches."),
                    
                    div(class = "notification-signup",
                        textInput("notify_email", placeholder = "Enter your email", value = ""),
                        actionButton("subscribe_notify", "Notify Me", class = "btn btn-primary")
                    )
                )
            )
        ),
        
        footer = div(
          actionButton("learn_more_chain", "Learn More", class = "btn btn-secondary"),
          actionButton("close_notify_modal", "Close", class = "btn btn-outline")
        )
      )
    )
  })
  
  # Similar handlers for other coming soon solutions
  observeEvent(input$notify_fevahealth, {
    showModal(
      modalDialog(
        title = "FevaHealth - Coming Soon",
        size = "m",
        easyClose = TRUE,
        
        div(class = "coming-soon-modal",
            div(class = "solution-preview",
                img(src = "assets/solutions/fevahealth-preview.png", alt = "FevaHealth", class = "solution-preview-img"),
                div(class = "solution-badge", "HealthTech")
            ),
            
            div(class = "solution-details",
                h3("FevaHealth"),
                p("Comprehensive digital health platform connecting patients, providers, and health systems across Africa."),
                
                div(class = "launch-timeline",
                    h4("Expected Launch: Q4 2025"),
                    div(class = "timeline-progress",
                        div(class = "progress-bar", style = "width: 40%"),
                        span("40% Complete", class = "progress-text")
                    )
                ),
                
                div(class = "notify-form",
                    h4("Get Notified"),
                    p("Be among the first to experience the future of healthcare."),
                    
                    div(class = "notification-signup",
                        textInput("notify_health_email", placeholder = "Enter your email", value = ""),
                        actionButton("subscribe_health_notify", "Notify Me", class = "btn btn-primary")
                    )
                )
            )
        ),
        
        footer = div(
          actionButton("learn_more_health", "Learn More", class = "btn btn-secondary"),
          actionButton("close_health_modal", "Close", class = "btn btn-outline")
        )
      )
    )
  })
  
  # Notification subscription handlers
  observeEvent(input$subscribe_notify, {
    req(input$notify_email)
    
    if (!grepl("^[\\w\\.-]+@[\\w\\.-]+\\.[a-zA-Z]{2,}$", input$notify_email)) {
      showNotification("Please enter a valid email address", type = "error")
      return()
    }
    
    showNotification("Thank you! You'll be notified when FevaChain launches.", type = "message", duration = 5)
    updateTextInput(session, "notify_email", value = "")
    removeModal()
  })
  
  observeEvent(input$subscribe_health_notify, {
    req(input$notify_health_email)
    
    if (!grepl("^[\\w\\.-]+@[\\w\\.-]+\\.[a-zA-Z]{2,}$", input$notify_health_email)) {
      showNotification("Please enter a valid email address", type = "error")
      return()
    }
    
    showNotification("Thank you! You'll be notified when FevaHealth launches.", type = "message", duration = 5)
    updateTextInput(session, "notify_health_email", value = "")
    removeModal()
  })
  
  # ===== FINAL MODAL CLOSE HANDLERS =====
  
  observeEvent(input$close_demo, { removeModal() })
  observeEvent(input$close_notify_modal, { removeModal() })
  observeEvent(input$close_health_modal, { removeModal() })
  
  # ===== SESSION MANAGEMENT =====
  
  # Handle session disconnect
  session$onSessionEnded(function() {
    # Cleanup tasks
    cat("Session ended\n")
  })
  
  # Initialize app state when session starts
  observeEvent(session$clientData, {
    # Initialize animations and interactions
    runjs("initializeApp();")
    
    # Set initial theme based on user preference
    runjs("setInitialTheme();")
    
    # Initialize scroll effects
    runjs("initializeScrollEffects();")
    
    # Show cookie banner if needed
    runjs("showCookieBannerIfNeeded();")
  }, once = TRUE)
}

# ================================================================
# RUN THE APPLICATION
# ================================================================

shinyApp(ui = ui, server = server)