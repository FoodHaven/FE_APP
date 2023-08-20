const checkBox = document.getElementById("location");
    const address = document.getElementById("street");
    const city = document.getElementById("city");
    const state = document.getElementById("state");
    const zipcode = document.getElementById("zipcode");
    checkBox.addEventListener("change", (event) => {
      if (event.currentTarget.checked == true) {
        address.disabled = true;
        city.disabled = true;
        state.disabled = true;
        zipcode.disabled = true;
      } else {
        address.disabled = false;
        city.disabled = false;
        state.disabled = false;
        zipcode.disabled = false;
      }
    })