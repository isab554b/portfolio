<section id="referencer" class="bg-myBeige">
  <div class="width_standard mx-auto padding_y_standard space_y_standard">
    <div class="flex justify-center">
      <div
        class="lg:w-2/3 flex justify-center flex-col text-center gap-y-4 md:gap-y-6"
      >
        <div
          class="space-y-2 flex flex-col items-center mx-auto justify-center"
        >
          <!-- prettier-ignore -->
          <p id="decorative_header" class="text-myBlue">{{ frontpage_content["testimonials_section"]["decorative_header_text"] }}</p>
          <h2 class="text-myBlue">
            {{ frontpage_content["testimonials_section"]["header_text"] }}
          </h2>
        </div>
      </div>
    </div>
    <div class="carousel-wrapper overflow-hidden">
      <div
        id="testimonial-carousel"
        class="carousel-track flex transition-transform duration-500 ease-in-out"
      >
        <!-- prettier-ignore -->
        % include('components/testimonial_component')
      </div>
    </div>

    <div class="flex justify-center gap-4 mt-4 text-myBlue">
      <button id="prev-btn" class="btn">←</button>
      <button id="next-btn" class="btn">→</button>
    </div>
  </div>
</section>

<style>
  .carousel-wrapper {
    overflow: hidden;
    width: 100%;
    padding: 0;
  }

  .carousel-track {
    display: flex;
    gap: 1rem;
    transition: transform 0.5s ease-in-out;
    will-change: transform;
  }

  .carousel-track > * {
    flex: 0 0 auto;
    box-sizing: border-box;
    width: 100%;
  }
  #prev-btn,
  #next-btn {
    background: transparent;
    border: none;

    font-size: 1.5rem;
    cursor: pointer;
    padding: 0 1rem;
    transition: color 0.3s ease;
  }

  #prev-btn:hover,
  #next-btn:hover {
    color: #ddd;
  }

  @media (min-width: 1024px) {
    .carousel-track > * {
      width: calc(50% - 0.5rem);
    }
  }
</style>

<script>
  document.addEventListener("DOMContentLoaded", () => {
    const track = document.querySelector(".carousel-track");
    let items = Array.from(track.children).filter(
      (el) => !el.classList.contains("clone")
    );
    let visibleItems = window.innerWidth >= 1024 ? 2 : 1;

    function addClones() {
      Array.from(track.children).forEach((child) => {
        if (child.classList.contains("clone")) {
          track.removeChild(child);
        }
      });

      items = Array.from(track.children).filter(
        (el) => !el.classList.contains("clone")
      );

      for (let i = 0; i < visibleItems; i++) {
        const clone = items[i].cloneNode(true);
        clone.classList.add("clone");
        track.appendChild(clone);
      }
    }

    addClones();

    let currentStep = 0;
    const totalItems = items.length;

    function updateCarousel(withTransition = true) {
      if (withTransition) {
        track.style.transition = "transform 0.5s ease-in-out";
      } else {
        track.style.transition = "none";
      }

      const itemWidth =
        track.children[0].getBoundingClientRect().width +
        parseFloat(getComputedStyle(track).gap);
      const shiftPx = currentStep * itemWidth;
      track.style.transform = `translateX(-${shiftPx}px)`;
    }

    function nextSlide() {
      currentStep++;
      updateCarousel();

      if (currentStep === totalItems) {
        setTimeout(() => {
          currentStep = 0;
          updateCarousel(false);
        }, 500);
      }
    }

    function prevSlide() {
      if (currentStep === 0) {
        currentStep = totalItems;
        updateCarousel(false);
        setTimeout(() => {
          currentStep--;
          updateCarousel();
        }, 20);
      } else {
        currentStep--;
        updateCarousel();
      }
    }

    document.getElementById("next-btn").addEventListener("click", nextSlide);
    document.getElementById("prev-btn").addEventListener("click", prevSlide);

    let autoSlideInterval = setInterval(nextSlide, 5000);

    function resetAutoSlide() {
      clearInterval(autoSlideInterval);
      autoSlideInterval = setInterval(nextSlide, 5000);
    }

    document
      .getElementById("next-btn")
      .addEventListener("click", resetAutoSlide);
    document
      .getElementById("prev-btn")
      .addEventListener("click", resetAutoSlide);

    window.addEventListener("resize", () => {
      const newVisibleItems = window.innerWidth >= 1024 ? 2 : 1;
      if (newVisibleItems !== visibleItems) {
        visibleItems = newVisibleItems;
        currentStep = 0;
        addClones();
        updateCarousel(false);
      }
    });

    updateCarousel();
  });
</script>
