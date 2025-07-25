% for testimonial in frontpage_content['testimonials_section']['testimonials']:
<div
  class="bg-myBlue p-8 rounded-lg h-full flex flex-col justify-between min-h-[380px]"
>
  <div class="space-y-6">
    <div id="icon_medium" class="size-6 text-white">
      <!-- prettier-ignore -->
      % include(f'{frontpage_content["testimonials_section"]["testimonial_icon"]}')
    </div>
    <p class="text-white italic">{{ testimonial["text"] }}</p>
  </div>

  <div class="inline-flex items-center gap-4 pt-6 mt-auto">
    <div class="justify-center flex flex-col">
      <p id="second_content_box_header_text">
        {{ testimonial["author_name"] }}
      </p>
      <p class="text-white text-sm">
        {{ testimonial["author_job_title"] }}
      </p>
    </div>
  </div>
</div>
% end
