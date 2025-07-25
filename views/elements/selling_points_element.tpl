% for selling_point in global_content['header']['header_bar']['selling_points']:
<li
  class="flex items-center cursor-default text-center text-myWhite justify-center gap-2"
>
  <div id="icon_small" class="fill-myWhite">
    <!-- prettier-ignore -->
    % include(f'{selling_point["icon"]}')
  </div>
  <p id="selling_point">{{ selling_point["text"] }}</p>
</li>
% end
