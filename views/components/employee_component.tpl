% for employee in employees:
<div class="h-full space-y-2 flex flex-col items-center text-center">
  <img
    alt="{{ employee['image_alt'] }}"
    class="flex-shrink-0 h-96 object-cover rounded-full object-center mb-4"
    src="/assets/images/team/{{ employee['employee_image'] }}"
  />
  <div class="w-full space-y-6">
    <div class="space-y-3">
      <div class="space-y-1">
        <p class="text-base tracking-widest text-myBlue">
          {{ employee["employee_name"] }}
        </p>
        <h5>{{ employee["employee_job_title"] }}</h5>
        <div class="flex items-center text-center justify-center gap-2">
          % include('elements/social_media_element')
        </div>
      </div>
    </div>
  </div>
</div>
% end
