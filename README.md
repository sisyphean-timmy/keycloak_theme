```bash
docker-compose up -d
```

* [How to creating a theme](https://www.keycloak.org/docs/latest/server_development/#creating-a-theme)
* disabled template cache for developing `./scripts/disable-theme-cache`
* [template](https://github.com/lukin/keywind)
* [with vue3](https://github.com/wrsouza/keycloak-theme-vuejs)
* [ftl syntax](https://freemarker.apache.org/docs/index.html)
* [Mui in browser](https://github.com/mui/material-ui/blob/master/examples/cdn/index.html)
* [react-swipezor](https://github.com/zeus2198/react-swipezor)
    ```bash
        cd ./react-swipezor
        npm install -g yarn # if u without it
        yarn install
        yarn build # build to keycloak theme's path 
    ```
    * about wepback setting
        * [librarytarget](https://webpack.js.org/configuration/output/#outputlibrarytarget)
        * [externals](https://webpack.js.org/configuration/externals/#externals)

```bash
docker volume prune # the volume should be prune manually when docker-compose up/down again
```

