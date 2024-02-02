FROM ubuntu:20.04
RUN apt-get update && apt-get install -y nginx
RUN rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
RUN echo "server { listen 80; server_name localhost; location / { root /usr/share/nginx/html; index index.html; } }" > /etc/nginx/sites-available/default && ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
RUN echo "<html><body><h1>It works!</h1></body></html>" > /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
