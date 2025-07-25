<div class="relative group hover:cursor-pointer">
  <a href="{{ case['link'] }}">
    <img
      class="w-auto object-cover object-center rounded-lg"
      src="/assets/images/portfolio/{{ case['illustration'] }}"
      alt="{{ case['illustration_alt'] }}"
    />
    <div
      class="absolute inset-0 bg-myBlue rounded-lg opacity-0 group-hover:opacity-80 transition duration-300 ease-in-out"
    ></div>
    <div class="absolute inset-0 flex items-center justify-center p-4">
      <h3
        class="text-2xl text-center text-white opacity-0 group-hover:opacity-100 transition duration-300 ease-in-out font-semibold"
      >
        {{ case["title"] }}
      </h3>
    </div>
  </a>
</div>
