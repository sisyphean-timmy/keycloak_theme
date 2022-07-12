<#import "components/document.ftl" as document>
<#import "components/layout/alerts.ftl" as alerts>
<#import "components/layout/another-way.ftl" as anotherWay>
<#import "components/layout/card.ftl" as card>
<#import "components/layout/card-footer.ftl" as cardFooter>
<#import "components/layout/card-header.ftl" as cardHeader>
<#import "components/layout/card-main.ftl" as cardMain>
<#import "components/layout/container.ftl" as container>
<#import "components/layout/locales.ftl" as locales>
<#import "components/layout/nav.ftl" as nav>
<#import "components/layout/required-fields.ftl" as requiredFields>
<#import "components/layout/title.ftl" as title>
<#import "components/layout/subtitle.ftl" as subtitle>
<#import "components/layout/username.ftl" as username>

<#macro
  registrationLayout
  displayInfo=false
  displayMessage=true
  displayRequiredFields=false
  showAnotherWayIfPresent=true
>
  <html>
    <head>
      <@document.kw />
    </head>
    <body> 
      <@container.kw>
        <div id="root"></div>
        <@nav.kw>
          <#nested "nav">
          <#if realm.internationalizationEnabled && locale.supported?size gt 1>
            <@locales.kw />
          </#if>
        </@nav.kw>
      </@container.kw>
      
      <style>
        :root {
          --primary:#ff5722;
          --primary-bg:#373740;
          --error:#ff1100;
          --success:#6fa96f;
          --tx-primary:white;
        }
      </style>

      <script type="text/babel">
        const Swipezor = window.Swipezor.default
        const {useState, useEffect} = window.React
        const ReactDOM = window.ReactDOM
        const {
          Typography,
          Container,
          Box,
          Button,
          Icon, 
          TextField,
        } = window.MaterialUI

        const getUrl = (url: string) => {
          return url.replace(/(&amp;)/g, '&')
        }

        const Root = ()=>{
          const [hasValidated,setHasValidated ] = useState(false)
          const [validations,setValidations] = useState({
            firstName: <#if messagesPerField.existsError('firstName')>"${kcSanitize(messagesPerField.get('firstName'))?no_esc}"<#else>""</#if>,
            lastName:  <#if messagesPerField.existsError('lastName')>"${kcSanitize(messagesPerField.get('lastName'))?no_esc}"<#else>""</#if>,
            email: <#if messagesPerField.existsError('email')>"${kcSanitize(messagesPerField.get('email'))?no_esc}"<#else>""</#if>,
            usernameOrPassword: <#if messagesPerField.existsError('username','password')>"${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}"<#else>""</#if>,
            username: <#if messagesPerField.existsError('username')>"${kcSanitize(messagesPerField.get('username'))?no_esc}"<#else>""</#if>,
            password: <#if messagesPerField.existsError('password')>"${kcSanitize(messagesPerField.get('password'))?no_esc}"<#else>""</#if>,
            passwordConfirm: <#if messagesPerField.existsError('password-confirm')>"${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}"<#else>""</#if>
          })
          console.log("[validations]",validations)
          return (
            <Box 
              style={{ 
                backgroundColor: "var(--primary-bg)",
                color:"white",
                borderRadius: "1rem",
                width: "100%",
                textAlign: "center",
                padding: "2rem",
                color: "var(--tx-primary)"
              }}
            >
              <img 
                style={{width:"100%",maxWidth:"300px",margin:"0 auto"}} 
                src="https://portal.cat.fetnet.net/logo_cat.svg" 
                alt="logo"
              />

              <form id="form" action={getUrl("${url.loginAction}")} method="post">
                <div style={{margin:"1rem 0"}}>
                  <div style={{display:"flex",gap:"1rem",alignItems:"end", margin:"2rem 0"}}>
                    <span className="material-symbols-outlined">person</span>
                    <TextField 
                      className="customTextField"
                      name="username"
                      label="請輸入帳號"
                      variant="standard"
                      onFocus={()=>setValidations(prv=>({...prv,usernameOrPassword:""}))}
                    />
                  </div>
                  <div style={{display:"flex",gap:"1rem",alignItems:"end", margin:"2rem 0"}}>
                    <span className="material-symbols-outlined">lock</span>
                    <TextField 
                      className="customTextField"
                      name="password"
                      type="password"
                      label="請輸入密碼"
                      variant="standard"
                      onFocus={()=>setValidations(prv=>({...prv,usernameOrPassword:""}))}
                    />
                  </div>
                </div>
              </form>
              { validations.usernameOrPassword && <small style={{color:'red'}}>{validations.usernameOrPassword}</small>}
              <Swipezor 
                mainText="滑動驗證後登入" 
                overlayText="滑動驗證後登入" 
                onSwipeDone={()=>setHasValidated(true)} 
              />
              <Button 
                className="customBtn"
                disabled={!hasValidated} 
                variant="contained"
                onClick={()=>document.getElementById("form").submit()}
              >Sign In</Button>
            </Box>
          )
        }
        ReactDOM.render(<Root/>,document.getElementById("root"))
      </script>
     
      <style>
        .customBtn,.customBtn:hover {
          background-color:var(--primary);
          color:var(--tx-primary);
        }
        .customBtn:disabled{
          background-color: gray;
        }

        .swipezor-but{
          margin: 4rem 0;
          color: var(--primary);
          cursor:pointer;
        }
        /*
        .swipezor-but--disabled {
          pointer-events: none !important;
        }
        */
        .swipezor-but .swipezor-overlay{
          background:var(--success); 
        }

        .customTextField{
          width: 100% !important;
        }
        .customTextField label {
          color: var(--tx-primary) !important;
        }
        .customTextField input{
          box-shadow: none !important;
        }
        .customTextField .MuiInput-root {
          border:none !important;
          color:var(--tx-primary);
        }
        .customTextField .MuiInput-root:before{
          border-color:var(--tx-primary) !important;
        }          
        .customTextField .MuiInput-root:after{
          border-color:var(--primary) !important;
        }        
      </style>
    </body>
  </html>
</#macro>
