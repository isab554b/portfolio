% for skill in skills:
<div
  class="space-y-2 md:space-y-4 h-full flex flex-col justify-center items-center text-center"
>
  <div class="w-14 h-auto">
    <!-- prettier-ignore -->
    % include(f'{ skill["icon"] }')
  </div>
  <div class="space-y-1">
    <p class="font-oswald text-lg font-semibold">{{ skill["title"] }}</p>
    <p class="font-montserrat text-sm">{{ skill["text"] }}</p>
  </div>
</div>
% end
