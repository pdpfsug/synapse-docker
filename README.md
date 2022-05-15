# Setup #

0. Generate a certificate if needed:

    ```bash
    docker run -it --rm -v "$(pwd)/certs/:/etc/letsencrypt" -p 80:80 -p 443:443 certbot/certbot certonly
    ```

1. Copy and configure environment:

    ```bash
    cp .env.example .env
    vim .env
    ```

2. Generate configuration files:

    ```bash
    ./make_configs.sh
    ```

3. Change `YOUR_IP/YOUR_IP` in `coturn/turnserver.conf`

4. Start server:

    ```bash
    docker-compose up -d
    ```

## Extra ##
* Create superuser:

    ```bash
    docker-compose exec synapse register_new_matrix_user -u USERNAME -p PASSWORD -a -c /data/homeserver.yaml
    ```


