<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="wrap">
  <h1>Registration Form</h1>

  <form action="<%=request.getContextPath()%>/RegisterServlet" method="post" onsubmit="return validateForm();">
    <table>
      <tr>
        <td>User id:</td>
        <td>
          <input class="box" type="text" id="userId" name="userId" />
          <span class="err" id="eUserId"></span>
        </td>
      </tr>

      <tr>
        <td>Password:</td>
        <td>
          <input class="box" type="password" id="password" name="password" />
          <span class="err" id="ePassword"></span>
        </td>
      </tr>

      <tr>
        <td>Name:</td>
        <td>
          <input class="box" type="text" id="name" name="name" />
          <span class="err" id="eName"></span>
        </td>
      </tr>

      <tr>
        <td>Address:</td>
        <td>
          <input class="box" type="text" id="address" name="address" />
          <span class="err"></span>
        </td>
      </tr>

      <tr>
        <td>Country:</td>
        <td>
          <select id="country" name="country">
            <option value="">Please select a country</option>
            <option value="Canada">Canada</option>
            <option value="USA">USA</option>
          </select>
          <span class="err" id="eCountry"></span>
        </td>
      </tr>

      <tr>
        <td>ZIP Code:</td>
        <td>
          <input class="box" type="text" id="zip" name="zip" />
          <span class="err" id="eZip"></span>
        </td>
      </tr>

      <tr>
        <td>Email:</td>
        <td>
          <input class="box" type="text" id="email" name="email" />
          <span class="err" id="eEmail"></span>
        </td>
      </tr>

      <tr>
        <td>Sex:</td>
        <td>
          <label><input type="radio" name="sex" value="Male"> Male</label>
          <label><input type="radio" name="sex" value="Female"> Female</label>
          <span class="err" id="eSex"></span>
        </td>
      </tr>

      <tr>
        <td>Language:</td>
        <td>
          <label><input type="checkbox" name="language" value="English"> English</label>
          <label><input type="checkbox" name="language" value="Non English"> Non English</label>
          <span class="err" id="eLang"></span>
        </td>
      </tr>

      <tr>
        <td>About:</td>
        <td>
          <textarea name="about" id="about"></textarea>
          <div class="err" style="margin-left:0;"></div>
        </td>
      </tr>

      <tr>
        <td></td>
        <td><input type="submit" value="Submit"></td>
      </tr>
    </table>
  </form>
</div>
</body>


  <script>
    function setErr(id, msg) { document.getElementById(id).textContent = msg || ""; }

    function validateForm() {
      let ok = true;

      const userId = document.getElementById("userId").value.trim();
      const password = document.getElementById("password").value;
      const name = document.getElementById("name").value.trim();
      const country = document.getElementById("country").value;
      const zip = document.getElementById("zip").value.trim();
      const email = document.getElementById("email").value.trim();

      ["eUserId","ePassword","eName","eCountry","eZip","eEmail","eSex","eLang"].forEach(x => setErr(x,""));

      if (userId.length < 5 || userId.length > 12) { setErr("eUserId","Required and must be of length 5 to 12."); ok=false; }
      if (password.length < 7 || password.length > 12) { setErr("ePassword","Required and must be of length 7 to 12."); ok=false; }
      if (!/^[A-Za-z\s]+$/.test(name)) { setErr("eName","Required and alphabates only."); ok=false; }
      if (country === "") { setErr("eCountry","Required. Must select a country."); ok=false; }
      if (!/^[0-9]+$/.test(zip)) { setErr("eZip","Required. Must be numeric only."); ok=false; }
      if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) { setErr("eEmail","Required. Must be a valid email."); ok=false; }
      if (!document.querySelector('input[name="sex"]:checked')) { setErr("eSex","Required."); ok=false; }
      if (document.querySelectorAll('input[name="language"]:checked').length === 0) { setErr("eLang","Required."); ok=false; }

      return ok;
    }
  </script>
</html>

