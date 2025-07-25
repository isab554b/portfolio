// ##############################
// PROFILE.HTML

document.addEventListener("DOMContentLoaded", function () {
  const buttons = document.querySelectorAll(".menu_button");

  // Add styling to the first menu button
  if (buttons.length > 0) {
    buttons[0].classList.add("secondary_button_selected");
  }

  // Function to remove stylingn
  function removeSelectedClass() {
    buttons.forEach((button) => {
      button.classList.remove("secondary_button_selected");
    });
  }

  // Add event listener to each button
  buttons.forEach((button) => {
    button.addEventListener("click", function () {
      // Remove 'selected' styling from all buttons (only the clicked button is styled)
      removeSelectedClass();
      // Apply 'selected' styling to clicked menu button
      button.classList.add("secondary_button_selected");

      // Load the content and update URL based on the template of the clicked button
      const templateName = button.getAttribute("data-template");
      if (templateName) {
        loadTemplate(templateName);
        updateURL(templateName);
      }
    });
  });

  // Update URL with template name
  function updateURL(templateName) {
    window.location.hash = `/${templateName}`;
  }

  // Load templates dynamically
  function loadTemplate(templateName) {
    fetch(`/profile/${templateName}`)
      .then((response) => response.text())
      .then((html) => {
        console.log(`Template loaded successfully`);
        document.getElementById("profile_content").innerHTML = html;
      })
      .catch((error) => console.error("Error loading template:", error));
  }

  // Open pop up button
  const openButton = document.getElementById("open_logout_pop_up");
  if (openButton) {
    openButton.addEventListener("click", function () {
      const popup = document.getElementById("logout_popup");
      if (popup) popup.classList.remove("object_hidden");
    });
  }

  // Close pop up button
  const closeButton = document.getElementById("close_logout_pop_up");
  if (closeButton) {
    closeButton.addEventListener("click", function () {
      const popup = document.getElementById("logout_popup");
      if (popup) popup.classList.add("object_hidden");
    });
  }
});

// ##############################
// BURGERMENU
document.addEventListener("DOMContentLoaded", function () {
  var burgerButton = document.getElementById("icon_large");
  var mobileNav = document.getElementById("mobile-nav");

  if (burgerButton && mobileNav) {
    burgerButton.addEventListener("click", function () {
      mobileNav.classList.toggle("hidden");
    });
  } else {
    if (!burgerButton) {
      console.error("Burger menu button not found");
    }
    if (!mobileNav) {
      console.error("Mobile navigation element not found");
    }
  }
});

// ##############################
// CONTACT FORMULAR - SEND MAILS
$("#mailForm").submit(function (event) {
  event.preventDefault();

  var formData = new FormData(this);

  $.ajax({
    url: "/send-email",
    type: "POST",
    data: formData,
    processData: false,
    contentType: false,
    success: function (response) {
      console.log("Success response:", response);
      if (response.error) {
        alert("Fejl: " + response.error);
      } else {
        $("#contactMessageSent").text(response.info).show();
        $("#mailForm")[0].reset();

        setTimeout(function () {
          $("#contactMessageSent").fadeOut();
        }, 2000);
      }
    },
    error: function (xhr) {
      console.error("Error response:", xhr);

      try {
        var response = JSON.parse(xhr.responseText);
        alert(
          "Der opstod en fejl: " +
            (response.error || response.info || "Ukendt fejl")
        );
      } catch (e) {
        alert("Serverfejl eller ikke-JSON svar modtaget.");
      }
    },
  });
});
