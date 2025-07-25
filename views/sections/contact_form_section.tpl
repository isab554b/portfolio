<div
  id="kontakt"
  class="grid grid-cols-1 lg:grid-cols-2 gap-8 lg:gap-16 justify-center items-center"
>
  <div class="flex items-center justify-center mx-auto">
    <div class="flex flex-col md:flex-col lg:flex-col justify-center gap-8">
      <div class="space-y-4">
        <h3>{{ contact_content["contact_form_section"]["header_text"] }}</h3>
        <p class="text-myBlue">
          {{ contact_content["contact_form_section"]["subheader_text"] }}
        </p>
      </div>
      <div class="flex flex-row items-center gap-4">
        <div class="fill-white text-white w-14 h-14 p-2 bg-myBlue rounded-lg">
          % include(global_content['ui_icons']['phone'])
        </div>
        <a href="tel:61727838"> <h5 class="text-myBlue">61 72 78 38</h5></a>
      </div>
      <div class="flex flex-row items-center gap-4">
        <div class="fill-white text-white w-14 h-14 p-2 bg-myBlue rounded-lg">
          % include(global_content['ui_icons']['email'])
        </div>
        <a href="mailto:isahilarius@hotmail.com">
          <h5>isahilarius@hotmail.com</h5></a
        >
      </div>
    </div>
  </div>
  <div
    class="bg-myBlue order-last mx-auto flex flex-col w-full p-4 md:p-10 lg:p-10 space-y-8 rounded-lg"
  >
    <form id="mailForm" action="/send-email" method="post" class="space-y-4">
      <label for="full_name" class="space-y-1.5 block">
        <div class="flex space-between justify-between">
          <p id="form_label">Navn</p>
        </div>
        <div class="relative w-full">
          <div
            class="absolute inset-y-0 start-0 flex items-center px-4 bg-myBeige rounded-bl-md rounded-tl-md"
          >
            <div id="icon_small" class="fill-myBlue text-myBlue w-5 h-5">
              % include(global_content['ui_icons']['user_circle'])
            </div>
          </div>
          <div
            class="absolute inset-y-0 start-0 flex items-center px-4 bg-myBeige rounded-bl-md rounded-tl-md"
          >
            <div id="icon_small" class="fill-myBlue text-myBlue w-5 h-5">
              % include(global_content['ui_icons']['user_circle'])
            </div>
          </div>
          <input
            id="form_input"
            type="text"
            name="full_name"
            placeholder="Dit navn"
            required
          />
        </div>
      </label>
      <label for="email" class="space-y-1.5 block">
        <div class="flex space-between justify-between">
          <p id="form_label">Email</p>
        </div>
        <div class="relative w-full">
          <div
            class="absolute inset-y-0 start-0 flex items-center px-4 bg-myBeige rounded-bl-md rounded-tl-md"
          >
            <div id="icon_small" class="fill-myBlue text-myBlue w-5 h-5">
              % include(global_content['ui_icons']['email'])
            </div>
          </div>
          <div
            class="absolute inset-y-0 start-0 flex items-center px-4 bg-myBeige rounded-bl-md rounded-tl-md"
          >
            <div id="icon_small" class="fill-myBlue text-myBlue w-5 h-5">
              % include(global_content['ui_icons']['email'])
            </div>
          </div>
          <input
            id="form_input"
            type="email"
            name="email"
            placeholder="Din email"
            required
          />
        </div>
      </label>
      <label for="message" class="space-y-1.5 block">
        <div class="flex space-between justify-between">
          <p id="form_label">Besked</p>
        </div>
        <div class="relative w-full overflow-auto">
          <div
            class="absolute inset-y-0 start-0 flex items-center px-4 bg-myBeige h-full rounded-bl-md rounded-tl-md"
          >
            <div id="icon_small" class="fill-myBlue text-myBlue w-5 h-5">
              % include(global_content['ui_icons']['message'])
            </div>
          </div>
          <textarea
            id="form_input"
            class="-mb-1.5"
            type="message"
            name="message"
            inputmode="text"
            placeholder="Din besked..."
            required
          ></textarea>
        </div>
      </label>
      <input type="text" name="website" style="display: none" />
      <button
        type="submit"
        id="third_button"
        class="contact-submit-button uppercase font-oswald"
      >
        Send besked
      </button>
    </form>
    <p
      id="contactMessageSent"
      style="display: none"
      class="text-myBeige text-sm"
    ></p>
  </div>
</div>
