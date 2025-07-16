# ================================================================
# FEVA ADVANCED SHINY APPLICATION
# Innovative Tech Company Website with Advanced Interactivity
# ================================================================

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

# Define UI
ui <- tagList(
  # Include external dependencies
  tags$head(
    # Meta tags for responsive design
    tags$meta(charset = "UTF-8"),
    tags$meta(name = "viewport", content = "width=device-width, initial-scale=1.0"),
    tags$meta(name = "description", content = "Feva - Intelligent Technology Solutions for Africa"),
    
    # Title
    tags$title("Feva - Advanced Technology Solutions"),
    
    # External CSS and JS dependencies
    tags$link(rel = "stylesheet", href = "https://fonts.googleapis.com/css2?family=Inter:wght@100;300;400;500;600;700;800;900&display=swap"),
    tags$link(rel = "stylesheet", href = "https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"),
    tags$link(rel = "stylesheet", href = "https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css"),
    
    # Custom CSS
    includeCSS("www/feva-styles.css"),
    
    # Custom JavaScript
    tags$script(src = "https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"),
    tags$script(src = "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"),
    tags$script(src = "https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"),
    includeScript("www/feva-animations.js"),
    
    # Shiny JS
    useShinyjs()
  ),
  
  # Waiter for loading screens
  use_waiter(),
  waiter_show_on_load(
    html = div(
      class = "waiter-content",
      div(
        class = "logo-loader",
        h1("FEVA", class = "loader-text"),
        div(class = "loader-bar"),
        p("Loading Innovation...", class = "loader-subtitle")
      )
    ),
    color = "#ffffff"
  ),
  
  # Main application container
  div(
    class = "app-container",
    id = "main-app",
    
    # Navigation Header
    div(
      class = "navbar-container",
      id = "navbar",
      div(
        class = "container navbar-content",
        div(
          class = "nav-brand",
          div(
            class = "logo-container",
            h1("FEVA", class = "brand-logo", id = "brand-logo"),
            span("Tech", class = "brand-subtitle")
          )
        ),
        div(
          class = "nav-menu",
          id = "nav-menu",
          div(class = "nav-item", `data-target` = "hero", "Home"),
          div(class = "nav-item", `data-target` = "about", "About"),
          div(class = "nav-item", `data-target` = "services", "Services"),
          div(class = "nav-item", `data-target` = "products", "Products"),
          div(class = "nav-item", `data-target` = "portfolio", "Our Work"),
          div(class = "nav-item", `data-target` = "contact", "Contact")
        ),
        div(
          class = "nav-actions",
          actionButton(
            "cta_button",
            "Get Started",
            class = "btn btn-primary btn-cta",
            icon = icon("rocket")
          ),
          div(
            class = "mobile-menu-toggle",
            id = "mobile-toggle",
            span(class = "hamburger-line"),
            span(class = "hamburger-line"),
            span(class = "hamburger-line")
          )
        )
      )
    ),
    
    # Hero Section
    div(
      class = "section hero-section",
      id = "hero",
      div(
        class = "hero-background",
        id = "hero-bg"
      ),
      div(
        class = "container",
        div(
          class = "hero-content",
          `data-aos` = "fade-up",
          `data-aos-duration` = "1000",
          div(
            class = "hero-text",
            h1(
              class = "hero-title",
              "Intelligent Technology for ",
              span("Africa's Future", class = "text-accent")
            ),
            p(
              class = "hero-subtitle",
              "We combine deep analytical thinking with cutting-edge technology to build intelligent, future-ready solutions across data, software, and system development."
            ),
            div(
              class = "hero-stats",
              `data-aos` = "fade-up",
              `data-aos-delay` = "300",
              div(
                class = "stat-item",
                span("50+", class = "stat-number"),
                span("Projects Delivered", class = "stat-label")
              ),
              div(
                class = "stat-item",
                span("15+", class = "stat-number"),
                span("Government Partners", class = "stat-label")
              ),
              div(
                class = "stat-item",
                span("100%", class = "stat-number"),
                span("Client Satisfaction", class = "stat-label")
              )
            ),
            div(
              class = "hero-actions",
              `data-aos` = "fade-up",
              `data-aos-delay` = "500",
              actionButton(
                "explore_services",
                "Explore Services",
                class = "btn btn-primary btn-lg",
                icon = icon("arrow-right")
              ),
              actionButton(
                "watch_demo",
                "Watch Demo",
                class = "btn btn-secondary btn-lg",
                icon = icon("play")
              )
            )
          ),
          div(
            class = "hero-visual",
            `data-aos` = "fade-left",
            `data-aos-delay` = "200",
            div(
              class = "interactive-canvas",
              id = "canvas-container"
            )
          )
        )
      )
    ),
    
    # About Section
    div(
      class = "section about-section",
      id = "about",
      div(
        class = "container",
        div(
          class = "section-header",
          `data-aos` = "fade-up",
          h2("About Feva", class = "section-title"),
          p("Building the future of African technology", class = "section-subtitle")
        ),
        div(
          class = "about-grid",
          div(
            class = "about-card mission-card",
            `data-aos` = "flip-left",
            `data-aos-delay` = "100",
            div(class = "card-icon", icon("target")),
            h3("Our Mission", class = "card-title"),
            p("To empower Africa's transformation through intelligent technology and innovative digital solutions.", class = "card-description")
          ),
          div(
            class = "about-card vision-card",
            `data-aos` = "flip-left",
            `data-aos-delay` = "200",
            div(class = "card-icon", icon("eye")),
            h3("Our Vision", class = "card-title"),
            p("To become Africa's leading hub for data intelligence, smart systems, and software-driven innovation.", class = "card-description")
          ),
          div(
            class = "about-card approach-card",
            `data-aos` = "flip-left",
            `data-aos-delay` = "300",
            div(class = "card-icon", icon("cogs")),
            h3("Our Approach", class = "card-title"),
            p("We go beyond traditional consultancy — we are a product-driven company that designs, builds, and deploys digital solutions.", class = "card-description")
          )
        )
      )
    ),
    
    # Services Section
    div(
      class = "section services-section",
      id = "services",
      div(
        class = "container",
        div(
          class = "section-header",
          `data-aos` = "fade-up",
          h2("Our Services", class = "section-title"),
          p("Comprehensive technology solutions for modern challenges", class = "section-subtitle")
        ),
        div(
          class = "services-container",
          div(
            class = "service-card",
            id = "service-data",
            `data-aos` = "zoom-in",
            `data-aos-delay` = "100",
            div(class = "service-header",
                div(class = "service-icon", icon("chart-bar")),
                h3("Data & Analytics", class = "service-title")
            ),
            div(class = "service-content",
                tags$ul(
                  tags$li("Data Strategy & Governance"),
                  tags$li("Advanced Analytics & Business Intelligence"),
                  tags$li("AI & Machine Learning Solutions"),
                  tags$li("Data Visualization & Dashboards")
                )
            ),
            div(class = "service-footer",
                actionButton("learn_data", "Learn More", class = "btn btn-outline btn-sm")
            )
          ),
          div(
            class = "service-card",
            id = "service-software",
            `data-aos` = "zoom-in",
            `data-aos-delay` = "200",
            div(class = "service-header",
                div(class = "service-icon", icon("code")),
                h3("Software Development", class = "service-title")
            ),
            div(class = "service-content",
                tags$ul(
                  tags$li("Custom Web & Mobile Apps"),
                  tags$li("Enterprise System Design"),
                  tags$li("Land, Health, and Education Platforms"),
                  tags$li("API Integrations & Cloud Architecture")
                )
            ),
            div(class = "service-footer",
                actionButton("learn_software", "Learn More", class = "btn btn-outline btn-sm")
            )
          ),
          div(
            class = "service-card",
            id = "service-innovation",
            `data-aos` = "zoom-in",
            `data-aos-delay` = "300",
            div(class = "service-header",
                div(class = "service-icon", icon("lightbulb")),
                h3("Digital Innovation", class = "service-title")
            ),
            div(class = "service-content",
                tags$ul(
                  tags$li("R&D for Public Sector Challenges"),
                  tags$li("Social Impact Tech"),
                  tags$li("Prototyping and Piloting"),
                  tags$li("Climate & Health Solutions")
                )
            ),
            div(class = "service-footer",
                actionButton("learn_innovation", "Learn More", class = "btn btn-outline btn-sm")
            )
          ),
          div(
            class = "service-card",
            id = "service-advisory",
            `data-aos` = "zoom-in",
            `data-aos-delay` = "400",
            div(class = "service-header",
                div(class = "service-icon", icon("users")),
                h3("Advisory & Capacity", class = "service-title")
            ),
            div(class = "service-content",
                tags$ul(
                  tags$li("Digital Transformation Consulting"),
                  tags$li("Data Literacy Training"),
                  tags$li("AI/ML Education Programs"),
                  tags$li("Capacity Building Workshops")
                )
            ),
            div(class = "service-footer",
                actionButton("learn_advisory", "Learn More", class = "btn btn-outline btn-sm")
            )
          )
        )
      )
    ),
    
    # Products Section
    div(
      class = "section products-section",
      id = "products",
      div(
        class = "container",
        div(
          class = "section-header",
          `data-aos` = "fade-up",
          h2("Our Products", class = "section-title"),
          p("Innovative solutions for African institutions", class = "section-subtitle")
        ),
        div(
          class = "products-showcase",
          div(
            class = "product-card featured",
            `data-aos` = "slide-right",
            `data-aos-delay` = "100",
            div(class = "product-header",
                h3("FevaX", class = "product-name"),
                span("Coming Soon", class = "product-status")
            ),
            div(class = "product-description",
                p("A customizable analytics engine designed specifically for government institutions and NGOs to make data-driven decisions with ease.")
            ),
            div(class = "product-features",
                div(class = "feature-item", "Real-time Analytics"),
                div(class = "feature-item", "Custom Dashboards"),
                div(class = "feature-item", "Government Integration"),
                div(class = "feature-item", "Multi-language Support")
            ),
            div(class = "product-actions",
                actionButton("notify_fevax", "Get Notified", class = "btn btn-primary")
            )
          ),
          div(
            class = "product-card",
            `data-aos` = "slide-up",
            `data-aos-delay` = "200",
            div(class = "product-header",
                h3("FevaID", class = "product-name"),
                span("Coming Soon", class = "product-status")
            ),
            div(class = "product-description",
                p("A comprehensive citizen data identity verification tool that ensures secure and reliable identity management.")
            ),
            div(class = "product-actions",
                actionButton("notify_fevaid", "Get Notified", class = "btn btn-secondary")
            )
          ),
          div(
            class = "product-card",
            `data-aos` = "slide-left",
            `data-aos-delay` = "300",
            div(class = "product-header",
                h3("FevaBuilder", class = "product-name"),
                span("Coming Soon", class = "product-status")
            ),
            div(class = "product-description",
                p("A no-code dashboard builder specifically designed for African institutions to create powerful visualizations.")
            ),
            div(class = "product-actions",
                actionButton("notify_fevabuilder", "Get Notified", class = "btn btn-secondary")
            )
          )
        )
      )
    ),
    
    # Our Work / Portfolio Section
    div(
      class = "section portfolio-section",
      id = "portfolio",
      div(
        class = "container",
        div(
          class = "section-header",
          `data-aos` = "fade-up",
          h2("Our Work", class = "section-title"),
          p("Transforming institutions across Africa with innovative technology solutions", class = "section-subtitle")
        ),
        
        # Project Categories Filter
        div(
          class = "portfolio-filters",
          `data-aos` = "fade-up",
          `data-aos-delay` = "200",
          div(
            class = "filter-buttons",
            actionButton("filter_all", "All Projects", class = "filter-btn active", `data-filter` = "all"),
            actionButton("filter_government", "Government", class = "filter-btn", `data-filter` = "government"),
            actionButton("filter_health", "Healthcare", class = "filter-btn", `data-filter` = "health"),
            actionButton("filter_education", "Education", class = "filter-btn", `data-filter` = "education"),
            actionButton("filter_data", "Data Analytics", class = "filter-btn", `data-filter` = "data")
          )
        ),
        
        # Featured Project Showcase
        div(
          class = "featured-project",
          `data-aos` = "zoom-in",
          `data-aos-delay` = "300",
          div(
            class = "project-visual",
            div(
              class = "project-mockup",
              id = "featured-mockup"
            ),
            div(
              class = "project-stats",
              div(
                class = "stat-box",
                span("500K+", class = "stat-figure"),
                span("Citizens Served", class = "stat-desc")
              ),
              div(
                class = "stat-box",
                span("15", class = "stat-figure"),
                span("Government Agencies", class = "stat-desc")
              ),
              div(
                class = "stat-box",
                span("99.9%", class = "stat-figure"),
                span("System Uptime", class = "stat-desc")
              )
            )
          ),
          div(
            class = "project-details",
            div(class = "project-badge government", "Government"),
            h3("Rwanda National ID Verification System", class = "project-title"),
            p("A comprehensive digital identity verification platform serving over 500,000 Rwandan citizens. Built with advanced biometric integration, real-time verification APIs, and multi-language support.", class = "project-description"),
            div(
              class = "project-tech",
              span("Technologies:", class = "tech-label"),
              div(class = "tech-tags",
                  span("React", class = "tech-tag"),
                  span("Node.js", class = "tech-tag"),
                  span("PostgreSQL", class = "tech-tag"),
                  span("Biometric API", class = "tech-tag"),
                  span("Cloud Infrastructure", class = "tech-tag")
              )
            ),
            div(
              class = "project-impact",
              h4("Impact Achieved:"),
              tags$ul(
                tags$li("Reduced verification time from 2 hours to 30 seconds"),
                tags$li("Eliminated 95% of fraudulent identity cases"),
                tags$li("Enabled digital-first government services"),
                tags$li("Saved $2.3M annually in administrative costs")
              )
            ),
            div(
              class = "project-actions",
              actionButton("view_case_study", "View Full Case Study", class = "btn btn-primary", icon = icon("external-link")),
              actionButton("view_demo", "Live Demo", class = "btn btn-secondary", icon = icon("play"))
            )
          )
        ),
        
        # Project Portfolio Grid
        div(
          class = "portfolio-grid",
          `data-aos` = "fade-up",
          `data-aos-delay` = "400",
          
          # Project 1 - Healthcare Management
          div(
            class = "portfolio-card health",
            `data-category` = "health",
            div(
              class = "card-image",
              div(class = "image-placeholder health-bg"),
              div(class = "project-overlay",
                  div(class = "overlay-content",
                      h4("Hospital Management System"),
                      p("Digital transformation for King Faisal Hospital"),
                      actionButton("view_health", "View Project", class = "btn btn-primary btn-sm")
                  )
              )
            ),
            div(class = "card-content",
                div(class = "project-meta",
                    span("Healthcare", class = "category-tag health"),
                    span("2024", class = "year-tag")
                ),
                h4("Integrated Hospital Management Platform"),
                p("Comprehensive digital solution serving 50,000+ patients annually with real-time bed management, electronic health records, and AI-powered diagnostics support."),
                div(class = "project-metrics",
                    span("↗ 40% efficiency increase", class = "metric"),
                    span("⚡ 60% faster patient processing", class = "metric")
                )
            )
          ),
          
          # Project 2 - Education Platform
          div(
            class = "portfolio-card education",
            `data-category` = "education",
            div(
              class = "card-image",
              div(class = "image-placeholder education-bg"),
              div(class = "project-overlay",
                  div(class = "overlay-content",
                      h4("Smart Education Platform"),
                      p("Digital learning ecosystem for 100+ schools"),
                      actionButton("view_education", "View Project", class = "btn btn-primary btn-sm")
                  )
              )
            ),
            div(class = "card-content",
                div(class = "project-meta",
                    span("Education", class = "category-tag education"),
                    span("2024", class = "year-tag")
                ),
                h4("National Education Management System"),
                p("AI-powered learning platform connecting 100+ schools, 5,000+ teachers, and 80,000+ students with personalized learning paths and real-time performance analytics."),
                div(class = "project-metrics",
                    span("📈 25% improved test scores", class = "metric"),
                    span("🎯 90% student engagement", class = "metric")
                )
            )
          ),
          
          # Project 3 - Agriculture Data Platform
          div(
            class = "portfolio-card data government",
            `data-category` = "data government",
            div(
              class = "card-image",
              div(class = "image-placeholder data-bg"),
              div(class = "project-overlay",
                  div(class = "overlay-content",
                      h4("Smart Agriculture Analytics"),
                      p("Data-driven farming optimization"),
                      actionButton("view_agriculture", "View Project", class = "btn btn-primary btn-sm")
                  )
              )
            ),
            div(class = "card-content",
                div(class = "project-meta",
                    span("Data Analytics", class = "category-tag data"),
                    span("Government", class = "category-tag government"),
                    span("2023", class = "year-tag")
                ),
                h4("National Agriculture Intelligence Platform"),
                p("Satellite-powered crop monitoring system serving 10,000+ farmers with weather predictions, soil analysis, and market price optimization using machine learning."),
                div(class = "project-metrics",
                    span("🌾 30% crop yield increase", class = "metric"),
                    span("💰 $5M farmer income boost", class = "metric")
                )
            )
          ),
          
          # Project 4 - Land Registry System
          div(
            class = "portfolio-card government",
            `data-category` = "government",
            div(
              class = "card-image",
              div(class = "image-placeholder government-bg"),
              div(class = "project-overlay",
                  div(class = "overlay-content",
                      h4("Digital Land Registry"),
                      p("Blockchain-secured property management"),
                      actionButton("view_land", "View Project", class = "btn btn-primary btn-sm")
                  )
              )
            ),
            div(class = "card-content",
                div(class = "project-meta",
                    span("Government", class = "category-tag government"),
                    span("2023", class = "year-tag")
                ),
                h4("Blockchain Land Title Management"),
                p("Immutable digital land registry system protecting 2M+ property titles with blockchain technology, eliminating land disputes and enabling instant title transfers."),
                div(class = "project-metrics",
                    span("🔒 100% fraud elimination", class = "metric"),
                    span("⚡ 90% faster title transfers", class = "metric")
                )
            )
          ),
          
          # Project 5 - Financial Inclusion Platform
          div(
            class = "portfolio-card data",
            `data-category` = "data",
            div(
              class = "card-image",
              div(class = "image-placeholder fintech-bg"),
              div(class = "project-overlay",
                  div(class = "overlay-content",
                      h4("Financial Inclusion Analytics"),
                      p("AI-powered credit scoring for Africa"),
                      actionButton("view_fintech", "View Project", class = "btn btn-primary btn-sm")
                  )
              )
            ),
            div(class = "card-content",
                div(class = "project-meta",
                    span("Data Analytics", class = "category-tag data"),
                    span("2024", class = "year-tag")
                ),
                h4("Alternative Credit Scoring Platform"),
                p("Machine learning platform analyzing mobile money patterns, social connections, and behavioral data to provide credit scores for 1M+ unbanked individuals."),
                div(class = "project-metrics",
                    span("📊 85% prediction accuracy", class = "metric"),
                    span("🏦 500K+ loans approved", class = "metric")
                )
            )
          ),
          
          # Project 6 - Smart City Dashboard
          div(
            class = "portfolio-card government data",
            `data-category` = "government data",
            div(
              class = "card-image",
              div(class = "image-placeholder smartcity-bg"),
              div(class = "project-overlay",
                  div(class = "overlay-content",
                      h4("Smart City Command Center"),
                      p("Real-time city management platform"),
                      actionButton("view_smartcity", "View Project", class = "btn btn-primary btn-sm")
                  )
              )
            ),
            div(class = "card-content",
                div(class = "project-meta",
                    span("Government", class = "category-tag government"),
                    span("Data Analytics", class = "category-tag data"),
                    span("2024", class = "year-tag")
                ),
                h4("Kigali Smart City Operations Center"),
                p("Integrated IoT and AI platform monitoring traffic, utilities, emergency services, and environmental data across Kigali with predictive analytics and automated responses."),
                div(class = "project-metrics",
                    span("🚦 35% traffic optimization", class = "metric"),
                    span("⚡ 45% faster emergency response", class = "metric")
                )
            )
          )
        ),
        
        # Client Testimonials
        div(
          class = "testimonials-section",
          `data-aos` = "fade-up",
          `data-aos-delay` = "500",
          h3("What Our Clients Say", class = "testimonials-title"),
          div(
            class = "testimonials-grid",
            div(
              class = "testimonial-card",
              div(class = "testimonial-content",
                  p("\"Feva transformed our entire patient management system. The 40% efficiency increase has allowed us to serve more patients while maintaining the highest quality of care.\""),
                  div(class = "testimonial-author",
                      span("Dr. Sarah Uwimana", class = "author-name"),
                      span("CTO, King Faisal Hospital", class = "author-title")
                  )
              )
            ),
            div(
              class = "testimonial-card",
              div(class = "testimonial-content",
                  p("\"The National ID system has revolutionized how we serve citizens. What used to take hours now happens in seconds, and fraud has become virtually non-existent.\""),
                  div(class = "testimonial-author",
                      span("Jean Claude Nzeyimana", class = "author-name"),
                      span("Director of Digital Services, NISR", class = "author-title")
                  )
              )
            ),
            div(
              class = "testimonial-card",
              div(class = "testimonial-content",
                  p("\"Feva's agriculture platform helped our farmers increase yields by 30%. The predictive analytics and market insights have been game-changing for rural communities.\""),
                  div(class = "testimonial-author",
                      span("Agnes Kalibata", class = "author-name"),
                      span("Minister of Agriculture, Rwanda", class = "author-title")
                  )
              )
            )
          )
        ),
        
        # Call to Action
        div(
          class = "portfolio-cta",
          `data-aos` = "zoom-in",
          `data-aos-delay` = "600",
          div(class = "cta-content",
              h3("Ready to Transform Your Institution?"),
              p("Join 50+ organizations across Africa who trust Feva to build their digital future."),
              div(class = "cta-actions",
                  actionButton("start_project", "Start Your Project", class = "btn btn-primary btn-lg", icon = icon("rocket")),
                  actionButton("view_all_work", "View All Case Studies", class = "btn btn-secondary btn-lg", icon = icon("folder-open"))
              )
          )
        )
      )
    ),
    
    # Contact Section
    div(
      class = "section contact-section",
      id = "contact",
      div(
        class = "container",
        div(
          class = "section-header",
          `data-aos` = "fade-up",
          h2("Let's Build the Future Together", class = "section-title"),
          p("Ready to transform your organization with intelligent technology?", class = "section-subtitle")
        ),
        div(
          class = "contact-content",
          div(
            class = "contact-form-container",
            `data-aos` = "slide-right",
            `data-aos-delay` = "200",
            div(class = "contact-form",
                textInput("contact_name", "Full Name", placeholder = "Your full name"),
                textInput("contact_email", "Email Address", placeholder = "your.email@domain.com"),
                selectInput(
                  "contact_service",
                  "Service Interest:",
                  choices = list(
                    "Data & Analytics" = "data",
                    "Software Development" = "software",
                    "Digital Innovation" = "innovation",
                    "Advisory & Capacity Building" = "advisory",
                    "Custom Solution" = "custom"
                  )
                ),
                textAreaInput("contact_message", "Project Description", 
                              placeholder = "Tell us about your project and requirements...",
                              rows = 4),
                div(class = "form-actions",
                    actionButton(
                      "submit_contact",
                      "Send Message",
                      class = "btn btn-primary btn-lg",
                      icon = icon("paper-plane")
                    )
                )
            )
          ),
          div(
            class = "contact-info",
            `data-aos` = "slide-left",
            `data-aos-delay` = "300",
            div(class = "info-section",
                h3("Our Clients", class = "info-title"),
                div(class = "client-types",
                    div(class = "client-type", "Government Institutions"),
                    div(class = "client-type", "NGOs & Development Agencies"),
                    div(class = "client-type", "Startups & SMEs"),
                    div(class = "client-type", "Universities & Research")
                )
            ),
            div(class = "info-section",
                h3("Rwanda Office", class = "info-title"),
                p("Kigali Innovation City", class = "info-detail"),
                p("Building Digital Africa", class = "info-detail")
            )
          )
        )
      )
    ),
    
    # Footer
    div(
      class = "footer-section",
      div(
        class = "container",
        div(
          class = "footer-content",
          div(class = "footer-brand",
              h3("FEVA", class = "footer-logo"),
              p("Building Africa's digital future, one solution at a time.", class = "footer-tagline")
          ),
          div(class = "footer-links",
              h4("Services"),
              tags$ul(
                tags$li("Data & Analytics"),
                tags$li("Software Development"),
                tags$li("Digital Innovation"),
                tags$li("Advisory & Capacity")
              )
          ),
          div(class = "footer-links",
              h4("Products"),
              tags$ul(
                tags$li("FevaX Analytics"),
                tags$li("FevaID Verification"),
                tags$li("FevaBuilder Platform"),
                tags$li("Custom Solutions")
              )
          ),
          div(class = "footer-contact",
              h4("Connect"),
              p("© 2025 Feva. All rights reserved."),
              p("Intelligent Technology for Africa")
          )
        )
      )
    )
  )
)

# Define Server Logic
server <- function(input, output, session) {
  
  # Hide waiter after app loads
  waiter_hide()
  
  # Reactive data for analytics dashboard
  dashboard_data <- reactive({
    req(input$data_source)
    
    # Simulate different datasets based on selection
    years <- seq(input$time_range[1], input$time_range[2], by = 1)
    
    data_sets <- list(
      "economic" = data.frame(
        Year = years,
        Growth = cumsum(rnorm(length(years), 3.5, 1.2)),
        Investment = cumsum(rnorm(length(years), 2.8, 0.8)),
        Innovation = cumsum(rnorm(length(years), 4.2, 1.5))
      ),
      "digital" = data.frame(
        Year = years,
        Adoption = cumsum(rnorm(length(years), 8.5, 2.1)),
        Infrastructure = cumsum(rnorm(length(years), 6.2, 1.8)),
        Skills = cumsum(rnorm(length(years), 5.8, 1.4))
      ),
      "health" = data.frame(
        Year = years,
        Access = cumsum(rnorm(length(years), 4.8, 1.1)),
        Quality = cumsum(rnorm(length(years), 3.2, 0.9)),
        Efficiency = cumsum(rnorm(length(years), 5.5, 1.3))
      ),
      "education" = data.frame(
        Year = years,
        Enrollment = cumsum(rnorm(length(years), 6.8, 1.6)),
        Digital_Learning = cumsum(rnorm(length(years), 9.2, 2.3)),
        Outcomes = cumsum(rnorm(length(years), 4.5, 1.2))
      )
    )
    
    data_sets[[input$data_source]]
  })
  
  # Main chart output
  output$main_chart <- renderPlotly({
    data <- dashboard_data()
    
    p <- plot_ly(data, x = ~Year) %>%
      add_trace(y = ~get(names(data)[2]), name = names(data)[2], type = 'scatter', mode = 'lines+markers',
                line = list(color = '#08a006', width = 3),
                marker = list(color = '#08a006', size = 8)) %>%
      add_trace(y = ~get(names(data)[3]), name = names(data)[3], type = 'scatter', mode = 'lines+markers',
                line = list(color = '#0bc208', width = 3),
                marker = list(color = '#0bc208', size = 8)) %>%
      add_trace(y = ~get(names(data)[4]), name = names(data)[4], type = 'scatter', mode = 'lines+markers',
                line = list(color = '#067304', width = 3),
                marker = list(color = '#067304', size = 8)) %>%
      layout(
        title = list(text = paste("African", tools::toTitleCase(input$data_source), "Trends"), 
                     font = list(family = "Inter", size = 18, color = "#1a1a1a")),
        xaxis = list(title = "Year", gridcolor = '#f0f0f0'),
        yaxis = list(title = "Index Value", gridcolor = '#f0f0f0'),
        plot_bgcolor = 'rgba(0,0,0,0)',
        paper_bgcolor = 'rgba(0,0,0,0)',
        font = list(family = "Inter"),
        hovermode = 'x unified'
      )
    
    p
  })
  
  # Dynamic metrics
  output$metric_1_title <- renderText({
    switch(input$data_source,
           "economic" = "GDP Growth Rate",
           "digital" = "Digital Adoption",
           "health" = "Healthcare Access",
           "education" = "Enrollment Rate")
  })
  
  output$metric_1_value <- renderText({
    data <- dashboard_data()
    paste0(round(tail(data[,2], 1), 1), "%")
  })
  
  output$metric_2_title <- renderText({
    switch(input$data_source,
           "economic" = "Investment Index",
           "digital" = "Infrastructure Score",
           "health" = "Quality Index",
           "education" = "Digital Learning")
  })
  
  output$metric_2_value <- renderText({
    data <- dashboard_data()
    paste0(round(tail(data[,3], 1), 1), "%")
  })
  
  output$metric_3_title <- renderText({
    switch(input$data_source,
           "economic" = "Innovation Score",
           "digital" = "Skills Development",
           "health" = "Efficiency Rate",
           "education" = "Learning Outcomes")
  })
  
  output$metric_3_value <- renderText({
    data <- dashboard_data()
    paste0(round(tail(data[,4], 1), 1), "%")
  })
  
  # Button click handlers with advanced animations
  observeEvent(input$cta_button, {
    runjs("smoothScrollTo('contact');")
  })
  
  observeEvent(input$explore_services, {
    runjs("smoothScrollTo('services'); triggerServiceAnimation();")
  })
  
  observeEvent(input$watch_demo, {
    runjs("triggerDemoAnimation();")
  })
  
  observeEvent(input$generate_insights, {
    runjs("triggerInsightGeneration();")
    showNotification("Generating AI-powered insights...", type = "message", duration = 3)
  })
  
  # Contact form submission
  observeEvent(input$submit_contact, {
    req(input$contact_name, input$contact_email, input$contact_message)
    
    # Simulate form processing
    runjs("triggerFormSubmission();")
    
    showNotification(
      paste("Thank you", input$contact_name, "! We'll be in touch within 24 hours."),
      type = "success",
      duration = 5
    )
    
    # Reset form
    updateTextInput(session, "contact_name", value = "")
    updateTextInput(session, "contact_email", value = "")
    updateTextAreaInput(session, "contact_message", value = "")
  })
  
  # Product notification handlers
  observeEvent(input$notify_fevax, {
    showNotification("You'll be notified when FevaX launches!", type = "success", duration = 3)
    runjs("triggerProductInterest('fevax');")
  })
  
  observeEvent(input$notify_fevaid, {
    showNotification("You'll be notified when FevaID launches!", type = "success", duration = 3)
    runjs("triggerProductInterest('fevaid');")
  })
  
  observeEvent(input$notify_fevabuilder, {
    showNotification("You'll be notified when FevaBuilder launches!", type = "success", duration = 3)
    runjs("triggerProductInterest('fevabuilder');")
  })
}

# Run the application
shinyApp(ui = ui, server = server)