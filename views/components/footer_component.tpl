<footer class="text-myBlue text-sm bg-myBeige">
  <div
    class="width_big mx-auto gap-6 py-10 flex justify-between items-center flex-col lg:flex-row"
  >
    <!-- LOGO -->

    <a href="/">
      <!-- prettier-ignore -->
      <img
        class="w-32"
        src="/assets/logos/{{ global_content['logos']['logo']['primary_logo'] }}"
        alt="{{ global_content['logos']['logo']['logo_alt'] }}"
      />
    </a>

    <!-- FOOTER INFO -->
    <div
      class="text-xs flex-col cursor-default flex lg:flex-row justify-center text-center gap-2 lg:gap-6"
    >
      % for footer_info in global_content['footer']['footer_info']:
      <p>{{ footer_info }}</p>
      % end
    </div>
    <!-- SOME -->
    <div class="flex items-center text-center justify-center gap-2">
      % include('elements/social_media_element')
    </div>
  </div>
</footer>
