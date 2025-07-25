<!-- % include('components/header_bar_component') -->
<header
  class="text-myBlue text-base bg-myBeige sticky top-0 z-50 transition-all duration-300 ease-in-out border-b border-mylightBlue"
>
  <div class="width_big mx-auto flex items-center justify-between">
    <div class="flex">
      <a href="/">
        <!-- prettier-ignore -->
        <img
          class="w-44"
          src="/assets/logos/{{ global_content['logos']['logo']['primary_logo'] }}"
          alt="{{ global_content['logos']['logo']['logo_alt'] }}"
        />
      </a>
    </div>
    <div class="flex-1 flex justify-end">
      <nav class="hidden lg:flex gap-4 xl:gap-8 items-center">
        % include('elements/nav_items_element')

        <!-- prettier-ignore -->
        % for selling_point in global_content['header']['header_bar']['selling_points']:
        <button
          id="primary_button"
          class="flex items-center text-center text-myWhite justify-center gap-2"
        >
          <div id="icon_small" class="fill-myWhite">
            <!-- prettier-ignore -->
            % include(f'{selling_point["icon"]}')
          </div>
          <p id="selling_point">{{ selling_point["text"] }}</p>
        </button>
        % end
      </nav>
    </div>
    <div class="gap-2 lg:gap-4 flex items-center">
      <div class="flex lg:hidden">
        % include('utilities/buttons/burger_menu', link='/')
      </div>
    </div>
  </div>

  <!-- Mobil navigation -->
  <nav
    id="mobile-nav"
    class="flex-col flex items-center hidden bg-myBeige text-myBlue p-4 space-y-2"
  >
    % include('elements/nav_items_element')
  </nav>
</header>
