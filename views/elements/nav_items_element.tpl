% for nav_item in global_content['header']['nav_bar']['nav_items']:
<a
  href="{{ nav_item['link'] }}"
  class="group transition duration-300 cursor-pointer text-sm hover:scale-105 hover:font-semibold font-medium ease-in-out"
>
  {{ nav_item["text"] }}
  <span
    class="block max-w-0 group-hover:max-w-full transition-all duration-500 h-0.5 bg-myBlue"
  ></span>
</a>
% end
