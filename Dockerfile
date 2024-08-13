# Utiliser une image de base PHP avec Apache
FROM php:8.1-apache

# Copier les fichiers de votre application dans le conteneur
COPY . /var/www/html/

# Installer des extensions PHP supplémentaires si nécessaire
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Configurer les permissions pour Apache
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Exposer le port 80 pour accéder à l'application via le navigateur
EXPOSE 80

# Optionnel : Si vous avez un fichier de configuration Apache spécifique, vous pouvez le copier
# COPY ./config/my-apache-config.conf /etc/apache2/sites-available/000-default.conf

# Redémarrer Apache pour appliquer les changements (non nécessaire si Apache est déjà démarré par défaut)
CMD ["apache2-foreground"]
