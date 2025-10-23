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
    tags$header(
      class = "site-header",
      id = "site-header",
      
      div(
        class = "header-container",
        
        # Logo & Brand
        div(
          class = "brand-section",
          div(
            div(
              class = "brand-text",
              h1("FEVA", class = "brand-name"),
              span("TechAfrica", class = "brand-subtitle")
            )
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
          actionButton(
            "header_cta",
            "Get Started",
            class = "btn btn-primary btn-cta",
            icon = icon("arrow-right")
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
            
            
            # Hero Badge
            div(
              class = "hero-badge",
              icon("award", class = "badge-icon"),
              span("Award-Winning Technology Solutions")
            ),
            
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
            
            # Hero Statistics
            div(
              class = "hero-stats",
              
              
              div(class = "stat-item",
                  div(class = "stat-number", "200+"),
                  div(class = "stat-label", "Projects Delivered")
              ),
              div(class = "stat-item",
                  div(class = "stat-number", "50+"),
                  div(class = "stat-label", "Global Partners")
              ),
              div(class = "stat-item",
                  div(class = "stat-number", "1M+"),
                  div(class = "stat-label", "Lives Impacted")
              ),
              div(class = "stat-item",
                  div(class = "stat-number", "99.9%"),
                  div(class = "stat-label", "Success Rate")
              )
            ),
            
            # Hero Actions
            div(
              class = "hero-actions",
              
              
              actionButton(
                "hero_explore",
                "Explore Our Solutions",
                class = "btn btn-primary btn-lg",
                icon = icon("rocket")
              ),
              
              actionButton(
                "hero_demo",
                "Watch Demo",
                class = "btn btn-secondary btn-lg",
                icon = icon("play")
              )
            )
          ),
          
          # Updated R HTML Structure
          div(
            class = "hero-visual",
            
            # Main image carousel container
            div(
              class = "hero-image-container",
              
              # 3D Rotating Image Carousel
              div(
                class = "image-carousel",
                
                # Image 1 - Center/Main
                div(
                  class = "carousel-image main-image",
                  img(src = "image1.jpg", alt = "AI Solutions", class = "hero-image"),
                  div(class = "image-overlay", "AI Solutions")
                ),
                
                # Image 2 - Cloud Services
                div(
                  class = "carousel-image cloud-image",
                  img(src = "image2.jpg", alt = "Cloud Services", class = "hero-image"),
                  div(class = "image-overlay", "Cloud Services")
                ),
                
                # Image 3 - Data Analytics
                div(
                  class = "carousel-image data-image",
                  img(src = "image3.jpg", alt = "Data Analytics", class = "hero-image"),
                  div(class = "image-overlay", "Data Analytics")
                ),
                
                # Image 4 - Mobile Development
                div(
                  class = "carousel-image mobile-image",
                  img(src = "image4.jpg", alt = "Mobile Development", class = "hero-image"),
                  div(class = "image-overlay", "Mobile Development")
                ),
                
                # Image 5 - Security
                div(
                  class = "carousel-image security-image",
                  img(src = "image5.jpg", alt = "Security Solutions", class = "hero-image"),
                  div(class = "image-overlay", "Security Solutions")
                )
              ),
              
              # Floating particles/orbs
              div(
                class = "floating-particles",
                div(class = "particle particle-1"),
                div(class = "particle particle-2"),
                div(class = "particle particle-3"),
                div(class = "particle particle-4"),
                div(class = "particle particle-5"),
                div(class = "particle particle-6")
              ),
              
              # Enhanced Floating Tech Icons
              div(
                class = "floating-icons",
                div(class = "floating-icon icon-1", icon("robot")),
                div(class = "floating-icon icon-2", icon("cloud")),
                div(class = "floating-icon icon-3", icon("database")),
                div(class = "floating-icon icon-4", icon("mobile-alt")),
                div(class = "floating-icon icon-5", icon("shield-alt")),
                div(class = "floating-icon icon-6", icon("cogs")),
                div(class = "floating-icon icon-7", icon("chart-line")),
                div(class = "floating-icon icon-8", icon("code"))
              )
            )
          )
          
        )
      ),
      
      # ===== ABOUT SECTION =====
      tags$section(
        class = "about-section",
        id = "about",
        
        div(
          class = "section-container",
          
          # Section Header
          div(
            class = "section-header",
            `data-aos` = "fade-up",
            
            div(class = "section-badge", "About Feva"),
            h2(class = "section-title",
               "Pioneering Africa's ",
               span("Digital Renaissance", class = "title-accent")
            ),
            p(class = "section-subtitle",
              "We are more than a technology company - we are architects of Africa's digital future, building intelligent solutions that bridge the gap between innovation and impact."
            )
          ),
          
          # About Content Grid
          div(
            class = "about-grid",
            
            # Mission Card
            div(
              class = "about-card mission-card",
              
              
              div(class = "card-icon", icon("target")),
              h3(class = "card-title", "Our Mission"),
              p(class = "card-description",
                "To democratize access to advanced technology across Africa, empowering businesses and institutions with AI-driven solutions that create sustainable impact."
              )
            ),
            
            # Vision Card
            div(
              class = "about-card vision-card",
              
              
              div(class = "card-icon", icon("eye")),
              h3(class = "card-title", "Our Vision"),
              p(class = "card-description",
                "To become the leading technology catalyst in Africa, recognized globally for innovation, excellence, and transformative digital solutions."
              )
            ),
            
            # Values Card
            div(
              class = "about-card values-card",
              
              
              div(class = "card-icon", icon("heart")),
              h3(class = "card-title", "Our Values"),
              p(class = "card-description",
                "Innovation, integrity, and impact drive everything we do. We believe in ethical technology, sustainable solutions, and inclusive growth."
              )
            )
          ),
          
          # Company Journey Timeline
          div(
            class = "company-timeline",
            
            
            h3(class = "timeline-title", "Our Journey"),
            
            div(class = "timeline-container",
                div(class = "timeline-item",
                    div(class = "timeline-year", "2020"),
                    div(class = "timeline-content",
                        h4("Foundation"),
                        p("Founded with a vision to transform African technology landscape")
                    )
                ),
                div(class = "timeline-item",
                    div(class = "timeline-year", "2022"),
                    div(class = "timeline-content",
                        h4("Expansion"),
                        p("Expanded operations to serve 15+ countries across Africa")
                    )
                ),
                div(class = "timeline-item",
                    div(class = "timeline-year", "2024"),
                    div(class = "timeline-content",
                        h4("Innovation"),
                        p("Launched AI-powered solutions serving 1M+ users")
                    )
                ),
                div(class = "timeline-item",
                    div(class = "timeline-year", "2025"),
                    div(class = "timeline-content",
                        h4("Future"),
                        p("Pioneering next-generation technologies for global impact")
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
        
        div(
          class = "section-container",
          
          # Section Header
          div(
            class = "section-header",
            `data-aos` = "fade-up",
            
            div(class = "section-badge", "Our Services"),
            h2(class = "section-title",
               "Comprehensive Technology ",
               span("Solutions", class = "title-accent")
            ),
            p(class = "section-subtitle",
              "From AI-powered analytics to blockchain solutions, we deliver end-to-end technology services that drive innovation and growth."
            )
          ),
          
          # Services Grid
          div(
            class = "services-grid",
            
            # AI & Machine Learning Service
            div(
              class = "service-card ai-service",
              
              
              div(class = "service-header",
                  div(class = "service-icon", icon("brain")),
                  div(class = "service-badge", "AI/ML"),
                  h3(class = "service-title", "Artificial Intelligence")
              ),
              
              div(class = "service-image",
                  img(src = "assets/services/ai-service.svg", alt = "AI & ML Services", class = "service-img")
              ),
              
              div(class = "service-content",
                  p(class = "service-description",
                    "Advanced AI and machine learning solutions that transform data into actionable insights."
                  ),
                  
                  div(class = "service-features",
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Predictive Analytics")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Natural Language Processing")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Computer Vision")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Deep Learning Models")
                      )
                  )
              ),
              
              div(class = "service-footer",
                  actionButton("learn_ai", "Learn More", class = "btn btn-outline")
              )
            ),
            
            # Blockchain Service
            div(
              class = "service-card blockchain-service",
              
              
              div(class = "service-header",
                  div(class = "service-icon", icon("link")),
                  div(class = "service-badge", "Blockchain"),
                  h3(class = "service-title", "Blockchain Solutions")
              ),
              
              div(class = "service-image",
                  img(src = "assets/services/blockchain-service.svg", alt = "Blockchain Services", class = "service-img")
              ),
              
              div(class = "service-content",
                  p(class = "service-description",
                    "Secure, transparent, and decentralized solutions for modern business challenges."
                  ),
                  
                  div(class = "service-features",
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Smart Contracts")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("DeFi Applications")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("NFT Platforms")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Token Economy")
                      )
                  )
              ),
              
              div(class = "service-footer",
                  actionButton("learn_blockchain", "Learn More", class = "btn btn-outline")
              )
            ),
            
            # Cloud Infrastructure Service
            div(
              class = "service-card cloud-service",
              
              
              div(class = "service-header",
                  div(class = "service-icon", icon("cloud")),
                  div(class = "service-badge", "Cloud"),
                  h3(class = "service-title", "Cloud Infrastructure")
              ),
              
              div(class = "service-image",
                  img(src = "assets/services/cloud-service.svg", alt = "Cloud Services", class = "service-img")
              ),
              
              div(class = "service-content",
                  p(class = "service-description",
                    "Scalable, secure, and efficient cloud solutions that power modern applications."
                  ),
                  
                  div(class = "service-features",
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Cloud Migration")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("DevOps Automation")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Container Orchestration")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Microservices Architecture")
                      )
                  )
              ),
              
              div(class = "service-footer",
                  actionButton("learn_cloud", "Learn More", class = "btn btn-outline")
              )
            ),
            
            # Mobile Development Service
            div(
              class = "service-card mobile-service",
              
              
              div(class = "service-header",
                  div(class = "service-icon", icon("mobile-alt")),
                  div(class = "service-badge", "Development"),
                  h3(class = "service-title", "Mobile & Web Apps")
              ),
              
              div(class = "service-image",
                  img(src = "assets/services/mobile-service.svg", alt = "Mobile Development", class = "service-img")
              ),
              
              div(class = "service-content",
                  p(class = "service-description",
                    "User-centric applications that deliver exceptional experiences across all platforms."
                  ),
                  
                  div(class = "service-features",
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Cross-Platform Apps")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Progressive Web Apps")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("API Development")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("UI/UX Design")
                      )
                  )
              ),
              
              div(class = "service-footer",
                  actionButton("learn_mobile", "Learn More", class = "btn btn-outline")
              )
            ),
            
            # Data Analytics Service
            div(
              class = "service-card data-service",
              
              
              div(class = "service-header",
                  div(class = "service-icon", icon("chart-bar")),
                  div(class = "service-badge", "Analytics"),
                  h3(class = "service-title", "Data Analytics")
              ),
              
              div(class = "service-image",
                  img(src = "assets/services/data-service.svg", alt = "Data Analytics", class = "service-img")
              ),
              
              div(class = "service-content",
                  p(class = "service-description",
                    "Transform raw data into strategic insights that drive business growth and innovation."
                  ),
                  
                  div(class = "service-features",
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Business Intelligence")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Data Visualization")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Real-time Analytics")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Predictive Modeling")
                      )
                  )
              ),
              
              div(class = "service-footer",
                  actionButton("learn_data", "Learn More", class = "btn btn-outline")
              )
            ),
            
            # Cybersecurity Service
            div(
              class = "service-card security-service",
              
              
              div(class = "service-header",
                  div(class = "service-icon", icon("shield-alt")),
                  div(class = "service-badge", "Security"),
                  h3(class = "service-title", "Cybersecurity")
              ),
              
              div(class = "service-image",
                  img(src = "assets/services/security-service.svg", alt = "Cybersecurity", class = "service-img")
              ),
              
              div(class = "service-content",
                  p(class = "service-description",
                    "Comprehensive security solutions that protect your digital assets and ensure compliance."
                  ),
                  
                  div(class = "service-features",
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Threat Detection")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Identity Management")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Compliance Auditing")
                      ),
                      div(class = "feature-item",
                          icon("check", class = "feature-icon"),
                          span("Incident Response")
                      )
                  )
              ),
              
              div(class = "service-footer",
                  actionButton("learn_security", "Learn More", class = "btn btn-outline")
              )
            )
          )
        )
      ),
      
      # ===== SOLUTIONS SECTION =====
      tags$section(
        class = "solutions-section",
        id = "solutions",
        
        div(
          class = "section-container",
          
          # Section Header
          div(
            class = "section-header",
            `data-aos` = "fade-up",
            
            div(class = "section-badge", "Our Solutions"),
            h2(class = "section-title",
               "Innovative Products ",
               span("for Africa", class = "title-accent")
            ),
            p(class = "section-subtitle",
              "Purpose-built solutions designed specifically for African markets, addressing unique challenges with cutting-edge technology."
            )
          ),
          
          # Featured Solution
          div(
            class = "featured-solution",
            
            
            div(class = "solution-visual",
                img(src = "assets/solutions/fevaai-preview.png", alt = "FevaAI Platform", class = "solution-image"),
                div(class = "solution-badge", "AI-Powered")
            ),
            
            div(class = "solution-content",
                h3(class = "solution-name", "FevaAI"),
                p(class = "solution-description",
                  "Revolutionary AI platform that democratizes artificial intelligence for African businesses. No coding required."
                ),
                
                div(class = "solution-features",
                    div(class = "feature-highlight",
                        icon("magic", class = "feature-icon"),
                        span("Auto-ML Models")
                    ),
                    div(class = "feature-highlight",
                        icon("language", class = "feature-icon"),
                        span("Multi-Language Support")
                    ),
                    div(class = "feature-highlight",
                        icon("chart-line", class = "feature-icon"),
                        span("Real-time Analytics")
                    ),
                    div(class = "feature-highlight",
                        icon("mobile", class = "feature-icon"),
                        span("Mobile-First Design")
                    )
                ),
                
                div(class = "solution-actions",
                    actionButton("demo_fevaai", "Request Demo", class = "btn btn-primary btn-lg"),
                    actionButton("learn_fevaai", "Learn More", class = "btn btn-secondary btn-lg")
                )
            )
          ),
          
          # Other Solutions Grid
          div(
            class = "solutions-grid",
            
            # FevaChain
            div(
              class = "solution-card",
              
              
              div(class = "solution-header",
                  div(class = "solution-icon", icon("link")),
                  div(class = "solution-badge", "Blockchain"),
                  h4(class = "solution-title", "FevaChain")
              ),
              
              div(class = "solution-preview",
                  img(src = "assets/solutions/fevachain-preview.png", alt = "FevaChain", class = "solution-img")
              ),
              
              p(class = "solution-summary",
                "Secure blockchain infrastructure for identity verification and digital payments across Africa."
              ),
              
              div(class = "solution-tags",
                  span("Blockchain", class = "tech-tag"),
                  span("Smart Contracts", class = "tech-tag"),
                  span("DeFi", class = "tech-tag")
              ),
              
              actionButton("notify_fevachain", "Coming Soon", class = "btn btn-outline btn-sm")
            ),
            
            # FevaHealth
            div(
              class = "solution-card",
              
              
              div(class = "solution-header",
                  div(class = "solution-icon", icon("heartbeat")),
                  div(class = "solution-badge", "HealthTech"),
                  h4(class = "solution-title", "FevaHealth")
              ),
              
              div(class = "solution-preview",
                  img(src = "assets/solutions/fevahealth-preview.png", alt = "FevaHealth", class = "solution-img")
              ),
              
              p(class = "solution-summary",
                "Comprehensive digital health platform connecting patients, providers, and health systems."
              ),
              
              div(class = "solution-tags",
                  span("Telemedicine", class = "tech-tag"),
                  span("EMR", class = "tech-tag"),
                  span("AI Diagnostics", class = "tech-tag")
              ),
              
              actionButton("notify_fevahealth", "Coming Soon", class = "btn btn-outline btn-sm")
            ),
            
            # FevaEdu
            div(
              class = "solution-card",
              
              
              div(class = "solution-header",
                  div(class = "solution-icon", icon("graduation-cap")),
                  div(class = "solution-badge", "EdTech"),
                  h4(class = "solution-title", "FevaEdu")
              ),
              
              div(class = "solution-preview",
                  img(src = "assets/solutions/fevaedu-preview.png", alt = "FevaEdu", class = "solution-img")
              ),
              
              p(class = "solution-summary",
                "AI-powered learning platform that personalizes education for African students and institutions."
              ),
              
              div(class = "solution-tags",
                  span("Adaptive Learning", class = "tech-tag"),
                  span("VR/AR", class = "tech-tag"),
                  span("Analytics", class = "tech-tag")
              ),
              
              actionButton("notify_fevaedu", "Coming Soon", class = "btn btn-outline btn-sm")
            ),
            
            # FevaFinance
            div(
              class = "solution-card",
              
              
              div(class = "solution-header",
                  div(class = "solution-icon", icon("coins")),
                  div(class = "solution-badge", "FinTech"),
                  h4(class = "solution-title", "FevaFinance")
              ),
              
              div(class = "solution-preview",
                  img(src = "assets/solutions/fevafinance-preview.png", alt = "FevaFinance", class = "solution-img")
              ),
              
              p(class = "solution-summary",
                "Digital banking and financial inclusion platform designed for emerging markets."
              ),
              
              div(class = "solution-tags",
                  span("Mobile Banking", class = "tech-tag"),
                  span("Microfinance", class = "tech-tag"),
                  span("Credit Scoring", class = "tech-tag")
              ),
              
              actionButton("notify_fevafinance", "Coming Soon", class = "btn btn-outline btn-sm")
            )
          )
        )
      ),
      
      # ===== PORTFOLIO SECTION =====
      tags$section(
        class = "portfolio-section",
        id = "portfolio",
        
        div(
          class = "section-container",
          
          # Section Header
          div(
            class = "section-header",
            `data-aos` = "fade-up",
            
            div(class = "section-badge", "Our Portfolio"),
            h2(class = "section-title",
               "Transformative ",
               span("Success Stories", class = "title-accent")
            ),
            p(class = "section-subtitle",
              "Real impact, real results. Discover how we've helped organizations across Africa achieve digital transformation and drive sustainable growth."
            )
          ),
          
          # Portfolio Filters
          div(
            class = "portfolio-filters",
            
            
            div(class = "filter-tabs",
                actionButton("filter_all", "All Projects", class = "filter-tab active", `data-filter` = "all"),
                actionButton("filter_government", "Government", class = "filter-tab", `data-filter` = "government"),
                actionButton("filter_healthcare", "Healthcare", class = "filter-tab", `data-filter` = "healthcare"),
                actionButton("filter_education", "Education", class = "filter-tab", `data-filter` = "education"),
                actionButton("filter_fintech", "FinTech", class = "filter-tab", `data-filter` = "fintech"),
                actionButton("filter_enterprise", "Enterprise", class = "filter-tab", `data-filter` = "enterprise")
            )
          ),
          
          # Featured Project
          div(
            class = "featured-project",
            
            
            div(class = "project-visual",
                img(src = "assets/portfolio/featured-project.png", alt = "Rwanda Digital ID Platform", class = "project-image"),
                
                div(class = "project-metrics",
                    div(class = "metric-item",
                        span("2M+", class = "metric-number"),
                        span("Users Served", class = "metric-label")
                    ),
                    div(class = "metric-item",
                        span("50%", class = "metric-number"),
                        span("Cost Reduction", class = "metric-label")
                    ),
                    div(class = "metric-item",
                        span("24/7", class = "metric-number"),
                        span("Uptime", class = "metric-label")
                    )
                )
            ),
            
            div(class = "project-details",
                div(class = "project-tags",
                    span("Government", class = "project-tag government"),
                    span("AI-Powered", class = "project-tag ai"),
                    span("Award Winner", class = "project-tag award")
                ),
                
                h3(class = "project-title", "Rwanda Digital ID Platform"),
                
                p(class = "project-description",
                  "Revolutionary digital identity system serving 2M+ Rwandan citizens with biometric authentication, blockchain security, and AI-powered fraud detection."
                ),
                
                div(class = "tech-stack",
                    h4("Technology Stack"),
                    div(class = "tech-grid",
                        div(class = "tech-item",
                            icon("react", class = "tech-icon"),
                            span("React")
                        ),
                        div(class = "tech-item",
                            icon("node-js", class = "tech-icon"),
                            span("Node.js")
                        ),
                        div(class = "tech-item",
                            icon("database", class = "tech-icon"),
                            span("PostgreSQL")
                        ),
                        div(class = "tech-item",
                            icon("cloud", class = "tech-icon"),
                            span("AWS")
                        ),
                        div(class = "tech-item",
                            icon("brain", class = "tech-icon"),
                            span("AI/ML")
                        ),
                        div(class = "tech-item",
                            icon("shield", class = "tech-icon"),
                            span("Blockchain")
                        )
                    )
                ),
                
                div(class = "achievements",
                    h4("Key Achievements"),
                    div(class = "achievement-list",
                        div(class = "achievement-item",
                            icon("check-circle", class = "achievement-icon"),
                            span("99.9% system uptime achieved")
                        ),
                        div(class = "achievement-item",
                            icon("check-circle", class = "achievement-icon"),
                            span("Eliminated 95% of identity fraud")
                        ),
                        div(class = "achievement-item",
                            icon("check-circle", class = "achievement-icon"),
                            span("Reduced processing time by 90%")
                        ),
                        div(class = "achievement-item",
                            icon("check-circle", class = "achievement-icon"),
                            span("Saved $5M in operational costs")
                        )
                    )
                ),
                
                div(class = "project-actions",
                    actionButton("view_case_study", "View Case Study", class = "btn btn-primary btn-lg"),
                    actionButton("live_demo", "Live Demo", class = "btn btn-secondary btn-lg")
                )
            )
          ),
          
          # Portfolio Grid
          div(
            class = "portfolio-grid",
            
            
            # Healthcare Project
            div(
              class = "portfolio-card healthcare",
              `data-category` = "healthcare",
              
              div(class = "card-image",
                  img(src = "assets/portfolio/healthcare-project.png", alt = "Smart Hospital Management", class = "project-img"),
                  div(class = "card-overlay",
                      div(class = "overlay-content",
                          h4("Smart Hospital Management System"),
                          p("AI-powered hospital operations platform"),
                          div(class = "overlay-stats",
                              span("50K+ patients", class = "overlay-stat"),
                              span("40% efficiency boost", class = "overlay-stat")
                          )
                      )
                  )
              ),
              
              div(class = "card-content",
                  div(class = "project-meta",
                      span("Healthcare", class = "category-badge healthcare"),
                      span("2024", class = "year-badge")
                  ),
                  
                  h4("King Faisal Hospital Platform"),
                  
                  p("Comprehensive digital transformation of hospital operations, from patient management to AI-assisted diagnostics."),
                  
                  div(class = "impact-metrics",
                      div(class = "metric-item",
                          icon("users", class = "metric-icon"),
                          span("50K+ patients served")
                      ),
                      div(class = "metric-item",
                          icon("clock", class = "metric-icon"),
                          span("40% faster processing")
                      )
                  ),
                  
                  actionButton("view_healthcare", "View Project", class = "btn btn-outline btn-sm")
              )
            ),
            
            # Education Project
            div(
              class = "portfolio-card education",
              `data-category` = "education",
              
              div(class = "card-image",
                  img(src = "assets/portfolio/education-project.png", alt = "Smart Education Platform", class = "project-img"),
                  div(class = "card-overlay",
                      div(class = "overlay-content",
                          h4("National Education Management"),
                          p("AI-powered learning ecosystem"),
                          div(class = "overlay-stats",
                              span("200+ schools", class = "overlay-stat"),
                              span("100K+ students", class = "overlay-stat")
                          )
                      )
                  )
              ),
              
              div(class = "card-content",
                  div(class = "project-meta",
                      span("Education", class = "category-badge education"),
                      span("2024", class = "year-badge")
                  ),
                  
                  h4("Smart Education Platform"),
                  
                  p("Transforming education delivery with personalized learning paths, real-time analytics, and AI-powered assessment tools."),
                  
                  div(class = "impact-metrics",
                      div(class = "metric-item",
                          icon("school", class = "metric-icon"),
                          span("200+ schools connected")
                      ),
                      div(class = "metric-item",
                          icon("chart-line", class = "metric-icon"),
                          span("25% improved scores")
                      )
                  ),
                  
                  actionButton("view_education", "View Project", class = "btn btn-outline btn-sm")
              )
            ),
            
            # FinTech Project
            div(
              class = "portfolio-card fintech",
              `data-category` = "fintech",
              
              div(class = "card-image",
                  img(src = "assets/portfolio/fintech-project.png", alt = "Digital Banking Platform", class = "project-img"),
                  div(class = "card-overlay",
                      div(class = "overlay-content",
                          h4("Digital Banking Platform"),
                          p("Next-gen financial services"),
                          div(class = "overlay-stats",
                              span("1M+ users", class = "overlay-stat"),
                              span("$100M+ processed", class = "overlay-stat")
                          )
                      )
                  )
              ),
              
              div(class = "card-content",
                  div(class = "project-meta",
                      span("FinTech", class = "category-badge fintech"),
                      span("2023", class = "year-badge")
                  ),
                  
                  h4("Mobile Banking Revolution"),
                  
                  p("Comprehensive digital banking platform with AI-powered fraud detection, microfinance, and financial inclusion features."),
                  
                  div(class = "impact-metrics",
                      div(class = "metric-item",
                          icon("users", class = "metric-icon"),
                          span("1M+ active users")
                      ),
                      div(class = "metric-item",
                          icon("dollar-sign", class = "metric-icon"),
                          span("$100M+ processed")
                      )
                  ),
                  
                  actionButton("view_fintech", "View Project", class = "btn btn-outline btn-sm")
              )
            ),
            
            # Enterprise Project
            div(
              class = "portfolio-card enterprise",
              `data-category` = "enterprise",
              
              div(class = "card-image",
                  img(src = "assets/portfolio/enterprise-project.png", alt = "Smart City Platform", class = "project-img"),
                  div(class = "card-overlay",
                      div(class = "overlay-content",
                          h4("Smart City Operations"),
                          p("IoT-powered city management"),
                          div(class = "overlay-stats",
                              span("10K+ sensors", class = "overlay-stat"),
                              span("30% efficiency gain", class = "overlay-stat")
                          )
                      )
                  )
              ),
              
              div(class = "card-content",
                  div(class = "project-meta",
                      span("Enterprise", class = "category-badge enterprise"),
                      span("2024", class = "year-badge")
                  ),
                  
                  h4("Kigali Smart City Platform"),
                  
                  p("Integrated IoT and AI platform for city-wide operations, traffic management, and predictive maintenance."),
                  
                  div(class = "impact-metrics",
                      div(class = "metric-item",
                          icon("city", class = "metric-icon"),
                          span("City-wide coverage")
                      ),
                      div(class = "metric-item",
                          icon("bolt", class = "metric-icon"),
                          span("30% efficiency gain")
                      )
                  ),
                  
                  actionButton("view_enterprise", "View Project", class = "btn btn-outline btn-sm")
              )
            )
          ),
          
          # Client Testimonials
          div(
            class = "testimonials-section",
            
            
            h3(class = "testimonials-title", "What Our Clients Say"),
            
            div(class = "testimonials-carousel",
                div(class = "testimonial-card active",
                    div(class = "testimonial-content",
                        div(class = "quote-icon", icon("quote-left")),
                        p("Feva transformed our entire healthcare system. The AI-powered diagnostics have improved patient outcomes by 40% while reducing costs significantly."),
                        
                        div(class = "testimonial-author",
                            img(src = "assets/testimonials/author-1.jpg", alt = "Dr. Sarah Uwimana", class = "author-avatar"),
                            div(class = "author-info",
                                span("Dr. Sarah Uwimana", class = "author-name"),
                                span("CTO, King Faisal Hospital", class = "author-title"),
                                div(class = "author-rating",
                                    icon("star"), icon("star"), icon("star"), icon("star"), icon("star")
                                )
                            )
                        )
                    )
                ),
                
                div(class = "testimonial-card",
                    div(class = "testimonial-content",
                        div(class = "quote-icon", icon("quote-left")),
                        p("The digital ID system has revolutionized how we serve citizens. Processing time went from hours to seconds, and fraud is virtually eliminated."),
                        
                        div(class = "testimonial-author",
                            img(src = "assets/testimonials/author-2.jpg", alt = "Jean Claude Nzeyimana", class = "author-avatar"),
                            div(class = "author-info",
                                span("Jean Claude Nzeyimana", class = "author-name"),
                                span("Director, NISR", class = "author-title"),
                                div(class = "author-rating",
                                    icon("star"), icon("star"), icon("star"), icon("star"), icon("star")
                                )
                            )
                        )
                    )
                )
            ),
            
            div(class = "testimonial-controls",
                div(class = "testimonial-dots",
                    div(class = "dot active"),
                    div(class = "dot"),
                    div(class = "dot")
                )
            )
          )
        )
      ),
      
      # ===== TEAM SECTION =====
      tags$section(
        class = "team-section",
        id = "team",
        
        div(
          class = "section-container",
          
          # Section Header
          div(
            class = "section-header",
            `data-aos` = "fade-up",
            
            div(class = "section-badge", "Our Team"),
            h2(class = "section-title",
               "Meet the Visionaries ",
               span("Behind Innovation", class = "title-accent")
            ),
            p(class = "section-subtitle",
              "A diverse team of world-class engineers, designers, and strategists united by our mission to transform Africa through technology."
            )
          ),
          
          # Leadership Team
          div(
            class = "leadership-grid",
            
            
            # CEO
            div(
              class = "team-card ceo-card",
              
              div(class = "team-image-container",
                  img(src = "assets/team/ceo.jpg", alt = "CEO", class = "team-image"),
                  div(class = "team-overlay",
                      div(class = "social-links",
                          a(href = "#", icon("linkedin"), class = "social-link"),
                          a(href = "#", icon("twitter"), class = "social-link"),
                          a(href = "#", icon("github"), class = "social-link")
                      )
                  )
              ),
              
              div(class = "team-content",
                  h4(class = "team-name", "Dr. Amina Kwame"),
                  p(class = "team-role", "Chief Executive Officer"),
                  p(class = "team-bio",
                    "Visionary leader with 15+ years in AI and digital transformation. Former Google AI researcher and MIT graduate."
                  ),
                  
                  div(class = "team-expertise",
                      span("AI Strategy", class = "expertise-tag"),
                      span("Digital Transformation", class = "expertise-tag"),
                      span("Leadership", class = "expertise-tag")
                  )
              )
            ),
            
            # CTO
            div(
              class = "team-card cto-card",
              
              div(class = "team-image-container",
                  img(src = "assets/team/cto.jpg", alt = "CTO", class = "team-image"),
                  div(class = "team-overlay",
                      div(class = "social-links",
                          a(href = "#", icon("linkedin"), class = "social-link"),
                          a(href = "#", icon("twitter"), class = "social-link"),
                          a(href = "#", icon("github"), class = "social-link")
                      )
                  )
              ),
              
              div(class = "team-content",
                  h4(class = "team-name", "Samuel Ntare"),
                  p(class = "team-role", "Chief Technology Officer"),
                  p(class = "team-bio",
                    "Blockchain pioneer and cloud architecture expert. Previously led engineering teams at Microsoft and Amazon."
                  ),
                  
                  div(class = "team-expertise",
                      span("Blockchain", class = "expertise-tag"),
                      span("Cloud Architecture", class = "expertise-tag"),
                      span("Engineering", class = "expertise-tag")
                  )
              )
            ),
            
            # CPO
            div(
              class = "team-card cpo-card",
              
              div(class = "team-image-container",
                  img(src = "assets/team/cpo.jpg", alt = "CPO", class = "team-image"),
                  div(class = "team-overlay",
                      div(class = "social-links",
                          a(href = "#", icon("linkedin"), class = "social-link"),
                          a(href = "#", icon("twitter"), class = "social-link"),
                          a(href = "#", icon("dribbble"), class = "social-link")
                      )
                  )
              ),
              
              div(class = "team-content",
                  h4(class = "team-name", "Grace Mbabazi"),
                  p(class = "team-role", "Chief Product Officer"),
                  p(class = "team-bio",
                    "Design thinking expert with passion for user-centered innovation. Former Apple and IDEO design lead."
                  ),
                  
                  div(class = "team-expertise",
                      span("Product Strategy", class = "expertise-tag"),
                      span("UX Design", class = "expertise-tag"),
                      span("Innovation", class = "expertise-tag")
                  )
              )
            )
          ),
          
          # Team Stats
          div(
            class = "team-stats",
            
            
            div(class = "stat-item",
                div(class = "stat-number", "50+"),
                div(class = "stat-label", "Team Members")
            ),
            div(class = "stat-item",
                div(class = "stat-number", "15+"),
                div(class = "stat-label", "Countries")
            ),
            div(class = "stat-item",
                div(class = "stat-number", "10+"),
                div(class = "stat-label", "Years Experience")
            ),
            div(class = "stat-item",
                div(class = "stat-number", "25+"),
                div(class = "stat-label", "Certifications")
            )
          ),
          
          # Join Team CTA
          div(
            class = "join-team-cta",
            
            
            h3("Join Our Mission"),
            p("Ready to shape Africa's digital future? We're looking for passionate individuals who share our vision."),
            
            div(class = "cta-actions",
                actionButton("view_careers", "View Open Positions", class = "btn btn-primary btn-lg"),
                actionButton("culture_guide", "Culture Guide", class = "btn btn-secondary btn-lg")
            )
          )
        )
      ),
      
      # ===== CONTACT SECTION =====
      tags$section(
        class = "contact-section",
        id = "contact",
        
        div(
          class = "section-container",
          
          # Section Header
          div(
            class = "section-header",
            `data-aos` = "fade-up",
            
            div(class = "section-badge", "Get In Touch"),
            h2(class = "section-title",
               "Let's Build Something ",
               span("Amazing Together", class = "title-accent")
            ),
            p(class = "section-subtitle",
              "Ready to transform your business with intelligent technology? Our team is here to discuss your project and explore how we can help you achieve your goals."
            )
          ),
          
          # Contact Content
          div(
            class = "contact-content",
            
            # Contact Info
            div(
              class = "contact-info",
              
              
              div(class = "contact-methods",
                  div(class = "contact-method",
                      div(class = "method-icon", icon("envelope")),
                      div(class = "method-content",
                          h4("Email Us"),
                          p("hello@feva.africa"),
                          actionButton("email_contact", "Send Email", class = "btn btn-outline btn-sm")
                      )
                  ),
                  
                  div(class = "contact-method",
                      div(class = "method-icon", icon("phone")),
                      div(class = "method-content",
                          h4("Call Us"),
                          p("+250 788 123 456"),
                          actionButton("phone_contact", "Call Now", class = "btn btn-outline btn-sm")
                      )
                  ),
                  
                  div(class = "contact-method",
                      div(class = "method-icon", icon("map-marker-alt")),
                      div(class = "method-content",
                          h4("Visit Us"),
                          p("Kigali Innovation City, Rwanda"),
                          actionButton("office_visit", "Get Directions", class = "btn btn-outline btn-sm")
                      )
                  ),
                  
                  div(class = "contact-method",
                      div(class = "method-icon", icon("calendar")),
                      div(class = "method-content",
                          h4("Schedule Meeting"),
                          p("Book a consultation"),
                          actionButton("schedule_meeting", "Book Now", class = "btn btn-outline btn-sm")
                      )
                  )
              ),
              
              # Social Links
              div(class = "social-section",
                  h4("Follow Us"),
                  div(class = "social-links",
                      a(href = "#", icon("linkedin"), class = "social-link"),
                      a(href = "#", icon("twitter"), class = "social-link"),
                      a(href = "#", icon("github"), class = "social-link"),
                      a(href = "#", icon("youtube"), class = "social-link"),
                      a(href = "#", icon("instagram"), class = "social-link")
                  )
              )
            ),
            
            # Contact Form
            div(
              class = "contact-form-container",
              
              
              div(class = "form-header",
                  h3("Start Your Project"),
                  p("Tell us about your vision and we'll get back to you within 24 hours.")
              ),
              
              # Multi-step Form
              div(class = "contact-form",
                  
                  # Step 1: Basic Information
                  div(class = "form-step active", id = "step-1",
                      div(class = "step-header",
                          h4("Step 1: Basic Information"),
                          div(class = "step-progress",
                              div(class = "progress-bar", style = "width: 33%")
                          )
                      ),
                      
                      div(class = "form-group",
                          tags$label("Full Name *", `for` = "contact_name"),
                          textInput("contact_name", label = " ",placeholder = "Enter your full name", value = "")
                      ),
                      
                      div(class = "form-group",
                          tags$label("Email Address *", `for` = "contact_email"),
                          textInput("contact_email", label = " ",placeholder = "Enter your email address", value = "")
                      ),
                      
                      div(class = "form-group",
                          tags$label("Company/Organization", `for` = "contact_company"),
                          textInput("contact_company", label = " ",placeholder = "Enter your company name", value = "")
                      ),
                      
                      div(class = "form-group",
                          tags$label("Phone Number", `for` = "contact_phone"),
                          textInput("contact_phone", label = " ", placeholder = "Enter your phone number", value = "")
                      ),
                      
                      div(class = "form-actions",
                          actionButton("next_step_1", "Next Step", class = "btn btn-primary")
                      )
                  ),
                  
                  # Step 2: Project Details
                  div(class = "form-step", id = "step-2",
                      div(class = "step-header",
                          h4("Step 2: Project Details"),
                          div(class = "step-progress",
                              div(class = "progress-bar", style = "width: 66%")
                          )
                      ),
                      
                      div(class = "form-group",
                          tags$label("Project Type", `for` = "project_type"),
                          selectInput("project_type",label = " ", choices = list(
                            "Select project type" = "",
                            "AI & Machine Learning" = "ai_ml",
                            "Blockchain Solutions" = "blockchain",
                            "Mobile App Development" = "mobile",
                            "Web Application" = "web",
                            "Data Analytics" = "data",
                            "Cloud Infrastructure" = "cloud",
                            "Digital Transformation" = "transformation",
                            "Custom Solution" = "custom"
                          ), selected = "")
                      ),
                      
                      div(class = "form-group",
                          tags$label("Budget Range", `for` = "project_budget"),
                          selectInput("project_budget", label = " ",choices = list(
                            "Select budget range" = "",
                            "Under $10,000" = "under_10k",
                            "$10,000 - $50,000" = "10k_50k",
                            "$50,000 - $100,000" = "50k_100k",
                            "$100,000 - $500,000" = "100k_500k",
                            "Over $500,000" = "over_500k"
                          ), selected = "")
                      ),
                      
                      div(class = "form-group",
                          tags$label("Timeline", `for` = "project_timeline"),
                          selectInput("project_timeline", label = " ",choices = list(
                            "Select timeline" = "",
                            "ASAP" = "asap",
                            "Within 1 month" = "1_month",
                            "1-3 months" = "1_3_months",
                            "3-6 months" = "3_6_months",
                            "6+ months" = "6_plus_months"
                          ), selected = "")
                      ),
                      
                      div(class = "form-actions",
                          actionButton("prev_step_2", "Previous", class = "btn btn-secondary"),
                          actionButton("next_step_2", "Next Step", class = "btn btn-primary")
                      )
                  ),
                  
                  # Step 3: Project Description
                  div(class = "form-step", id = "step-3",
                      div(class = "step-header",
                          h4("Step 3: Tell Us More"),
                          div(class = "step-progress",
                              div(class = "progress-bar", style = "width: 100%")
                          )
                      ),
                      
                      div(class = "form-group",
                          tags$label("Project Description *", `for` = "project_description"),
                          textAreaInput("project_description", label = " ",
                                        placeholder = "Describe your project, goals, and any specific requirements...", 
                                        value = "", 
                                        rows = 5)
                      ),
                      
                      div(class = "form-group",
                          tags$label("How did you hear about us?", `for` = "referral_source"),
                          selectInput("referral_source", label = " ",choices = list(
                            "Select source" = "",
                            "Google Search" = "google",
                            "Social Media" = "social",
                            "Referral" = "referral",
                            "Conference/Event" = "event",
                            "Partner Network" = "partner",
                            "Other" = "other"
                          ), selected = "")
                      ),
                      
                      div(class = "form-group checkbox-group",
                          checkboxInput("newsletter_signup", "Subscribe to our newsletter for technology insights", value = FALSE),
                          checkboxInput("terms_agreement", "I agree to the Terms of Service and Privacy Policy *", value = FALSE)
                      ),
                      
                      div(class = "form-actions",
                          actionButton("prev_step_3", "Previous", class = "btn btn-secondary"),
                          actionButton("submit_project", "Submit Project", class = "btn btn-primary btn-lg")
                      )
                  )
              )
            )
          ),
          
          # Office Map
          div(
            class = "office-map",
            
            
            h3("Our Office"),
            
            div(class = "map-container",
                # Placeholder for interactive map
                div(class = "map-placeholder",
                    img(src = "assets/office-map.png", alt = "Feva Office Location", class = "map-image")
                )
            ),
            
            div(class = "office-details",
                h4("Kigali Innovation City"),
                p("Located in the heart of Rwanda's tech hub, our office is designed to foster innovation and collaboration."),
                
                div(class = "office-hours",
                    h5("Office Hours"),
                    p("Monday - Friday: 8:00 AM - 6:00 PM"),
                    p("Saturday: 9:00 AM - 2:00 PM"),
                    p("Sunday: Closed")
                )
            )
          )
        )
      )
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
                    img(src = "assets/feva-logo-white.svg", alt = "Feva Logo", class = "footer-logo-img"),
                    h3("FEVA", class = "footer-brand-name"),
                    p("TechAfrica", class = "footer-brand-subtitle")
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
                            tags$li(a(href = "#solutions", "FevaFinance")),
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
  
  # ===== FLOATING ELEMENTS =====
  
  # Floating Action Button
  div(
    class = "floating-action-btn",
    id = "floating-action-btn",
    icon("comments"),
    div(class = "fab-tooltip", "Chat with us")
  ),
  
  # Back to Top Button
  div(
    class = "back-to-top",
    id = "back-to-top",
    icon("arrow-up")
  )
  
  
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
  
  observeEvent(input$hero_demo, {
    showModal(
      modalDialog(
        title = "Feva Technology Demo",
        size = "l",
        easyClose = TRUE,
        
        div(class = "demo-modal-content",
            div(class = "video-container",
                # Placeholder for demo video
                div(class = "video-placeholder",
                    img(src = "assets/demo-video-thumbnail.jpg", alt = "Demo Video", class = "video-thumbnail"),
                    div(class = "play-button", icon("play"))
                )
            ),
            
            div(class = "demo-description",
                h3("See Feva in Action"),
                p("Watch how our AI-powered solutions are transforming businesses across Africa."),
                
                div(class = "demo-highlights",
                    div(class = "highlight-item",
                        icon("check"), "Real-time AI processing"
                    ),
                    div(class = "highlight-item",
                        icon("check"), "Seamless integration"
                    ),
                    div(class = "highlight-item",
                        icon("check"), "Scalable infrastructure"
                    )
                )
            )
        ),
        
        footer = div(
          actionButton("schedule_demo", "Schedule Live Demo", class = "btn btn-primary"),
          actionButton("close_demo_modal", "Close", class = "btn btn-secondary")
        )
      )
    )
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
  
  # Floating action button (chat)
  observeEvent(input$floating_action_btn, {
    showNotification("Chat feature coming soon! For immediate assistance, please use our contact form.", type = "message", duration = 5)
  })
  
  # Back to top functionality
  observeEvent(input$back_to_top, {
    runjs("smoothScrollToTop();")
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