<#macro kw>
  <title>${msg("loginTitle", (realm.displayName!""))}</title>

  <meta charset="utf-8" />
  <meta name="robots" content="noindex, nofollow" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <#if properties.meta?has_content>
    <#list properties.meta?split(" ") as meta>
      <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
    </#list>
  </#if>

  <#if properties.favicons?has_content>
    <#list properties.favicons?split(" ") as favicon>
      <link href="${url.resourcesPath}/${favicon?split('==')[0]}" rel="${meta?split('==')[1]}">
    </#list>
  </#if>

  <#if properties.styles?has_content>
    <#list properties.styles?split(" ") as style>
      <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
    </#list>
  </#if>

  <#if properties.scripts?has_content>
    <#list properties.scripts?split(" ") as script>
      <script defer src="${url.resourcesPath}/${script}" type="text/javascript"></script>
    </#list>
  </#if>

  <#--  <script src="${url.resourcesPath}/vendors/react.min.js" type="text/javascript"></script>
  <script src="${url.resourcesPath}/vendors/react-dom.min.js" type="text/javascript"></script>  -->
  <script crossorigin src="https://unpkg.com/react@16.13.1/umd/react.development.js"></script>
  <script crossorigin src="https://unpkg.com/react-dom@16.13.1/umd/react-dom.development.js"></script>

  <script src="${url.resourcesPath}/vendors/babel.min.js" type="text/javascript"></script>
  <script src="${url.resourcesPath}/vendors/material-ui.production.min.js" type="text/javascript"></script>
  <script src="${url.resourcesPath}/vendors/swipezor.min.js" type="text/javascript"></script>
  
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</#macro>
