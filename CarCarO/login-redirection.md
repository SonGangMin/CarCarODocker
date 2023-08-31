# Implementation of Login Redirection(server-side routing)

## Data Storage

### Web Storage(Session Storage/Local Storage) -> FE-side-controlled data

(vs: Server-side(Session) + Client-side(Cookie - client+server sharing))

```javascript
sessionStorage.loginRedirectUrl = "/.../...";
const redirectUrl = sessionStorage.loginRedirectUrl;
```

## Implementation

### Save Redirect URL on Session Storage

`index.js`

```javascript
// Server Side
exports.isLoggedIn = (req, res, next) => {
  if (req.isAuthenticated()) {
    next();
  } else {
    res.status(403).send(`
      <script>
        sessionStorage.loginRedirectUrl = '${req.originalUrl}';
        alert('로그인이 필요합니다.');
        location.href = '/login';
      </script>
    `);
  }
};
```

### HTML-side

- hidden tag name/value
- window.addEventListener("DOMContentLoaded", () => { ...

`login.ejs`

```html
<form action="/auth/login" method="post"
     onsubmit="sessionStorage.removeItem('loginRedirectUrl')">
    ...
    <!-- input 태그들은 name(변수명): value(내용) 느낌으로 매핑돼서 서버에 전달됨. -->
    <input type="hidden" id="redirectUrl" name="redirectUrl">
</form>

`login.ejs`

...
<script>
    // Page Ready ... a little different to <script defer ... >
    window.addEventListener("DOMContentLoaded", () => {
        // load: <input type="hidden" id="redirectUrl" name="redirectUrl">
        const hiddenTag = document.getElementById("redirectUrl");
        // sessionStorage.loginRedirectUrl 이거 넣을 건데
        // 만약 null/undefined면 "/"를 넣겠다. 초깃값처럼.
        const redirectUri = sessionStorage.loginRedirectUrl ?? "/";

        hiddenTag.value = redirectUri;
    });
</script>
```

### Login and Redirect(at Server)

전달받은 req.body 안에 담긴 redirectUrl 사용

`auth.js`

```javascript
// Server Side(<- /auth/login)
exports.login = (req, res, next) => {
    passport.authenticate("local", (authError, user, info) => {
        // ... (codes)

        return req.login(user, (loginError) => {
            // <input type="hidden" name="redirectUrl" ... >의 value가 req.body에 담겨 있으니까 그걸 넣은 것.
            return res.redirect(req.body.redirectUrl); // <- 기존: return res.redirect("/");
        });
    })(req, res, next);
};
```