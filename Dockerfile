# Start with PHP 8.3 FPM (FastCGI Process Manager)
FROM php:8.3-fpm

# Update package list and install dependencies
RUN apt-get update && apt-get install -y \
    git \                    
    curl \                  
    libpng-dev \           
    libonig-dev \         
    libxml2-dev \        
    libzip-dev \        
    libicu-dev \       
    zip \             
    unzip            

# Clean up to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
# Each one serves specific purpose:
RUN docker-php-ext-install \
    mysqli \
    pdo_mysql \            
    mbstring \            
    exif \               
    pcntl \             
    bcmath \           
    gd \              
    intl \           
    zip \           
    opcache        

# Redis for caching/sessions
RUN pecl install redis && docker-php-ext-enable redis

# Xdebug for debugging - REMOVE IN PRODUCTION!
RUN pecl install xdebug && docker-php-ext-enable xdebug
