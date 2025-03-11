# Usa una imagen base de PHP con Apache
FROM php:7.4-apache

# Asegúrate de que el sistema operativo base tenga las herramientas necesarias
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    unzip \
    git \
    && apt-get clean

# Habilita las extensiones de PHP necesarias
RUN docker-php-ext-install gd mysqli  # Aseguramos que MySQLi se instale junto con GD

# Instalar Composer (si lo necesitas para dependencias de PHP)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Clonamos el repositorio de phpqrcode desde GitHub
RUN git clone https://github.com/t0k4rt/phpqrcode.git /var/www/html/phpqrcode

# Clonamos el repositorio oficial de FPDF desde GitHub
RUN git clone https://github.com/Setasign/FPDF.git /var/www/html/fpdf

# Habilita el módulo de Apache
RUN a2enmod rewrite

# Copia los archivos de tu proyecto al contenedor
COPY . /var/www/html/

# Establece los permisos para los archivos copiados
RUN chown -R www-data:www-data /var/www/html

# Exponer el puerto 80 (por defecto para Apache)
EXPOSE 80

# Inicia Apache
CMD ["apache2-foreground"]
