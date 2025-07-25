<section class="bg-cover">
  <div
    class="width_standard padding_y_standard mx-auto gap-12 lg:gap-16 flex lg:flex-row flex-col items-center"
  >
    <div
      class="lg:flex-grow lg:w-1/2 lg:gap-14 gap-10 flex flex-col lg:items-start lg:text-left items-center text-center"
    >
      <div class="gap-4 flex flex-col space-y-1">
        <p id="decorative_header">Hej, mit navn er Isabella</p>
        <h1 class="text-myBlue font-light">
          Jeg skaber <span id="dynamic-text" class="font-bold"></span>
        </h1>

        <p id="h1_subheader" class="text-myBlue">
          Med en baggrund i multimediedesign og webudvikling
          <span id="sub-bold" class="font-semibold"
            >skaber jeg gennemtænkte løsninger</span
          >
          <span id="sub-italic" class="italic"
            >- hvor form og funktion går hånd i hånd.</span
          >
        </p>
      </div>

      <!-- BUTTON -->
      <div class="w-fit flex flex-row gap-4">
        <a href="/#portfolio">
          <button
            class="text-white text-sm w-full md:text-base font-bold font-oswald bg-mylightBlue py-3.5 px-10 rounded-md drop-shadow-xl transition ease-in-out duration-300 hover:scale-105"
          >
            SE PORTFOLIO
          </button>
        </a>
        <a href="/#kontakt">
          <button
            class="text-white text-sm w-full md:text-base font-bold font-oswald bg-myBlue py-3.5 px-10 rounded-md drop-shadow-xl transition ease-in-out duration-300 hover:scale-105"
          >
            KONTAKT
          </button>
        </a>
      </div>
    </div>
    <div class="lg:w-1/2">
      <img
        src="/assets/images/team/isabella.png"
        alt="Billede af Isabella"
        class="max-w-full h-auto"
      />
    </div>
  </div>
</section>

<script>
  const phrases = [
    "brugervenlige løsninger",
    "digitale oplevelser med kant",
    "design der fungerer",
    "struktur og sammenhæng",
    "visuelle identiteter",
    "kode med omtanke",
    "webdesign med personlighed",
    "oplevelser der engagerer",
    "løsninger i øjenhøjde",
    "æstetik med funktion",
    "design der fortæller en historie",
    "intuitive brugerrejser",
    "oplevelser der gør indtryk",
    "visuelle koncepter med retning",
    "interfaces der giver mening",
    "sider der taler til brugeren",
  ];

  const element = document.getElementById("dynamic-text");
  let phraseIndex = 0;
  let charIndex = 0;
  let isDeleting = false;

  function typeEffect() {
    const currentPhrase = phrases[phraseIndex];
    const currentText = currentPhrase.substring(0, charIndex);
    element.textContent = currentText;

    if (!isDeleting && charIndex < currentPhrase.length) {
      charIndex++;
      setTimeout(typeEffect, 100); // hastighed for indtastning
    } else if (isDeleting && charIndex > 0) {
      charIndex--;
      setTimeout(typeEffect, 50); // hastighed for sletning
    } else {
      isDeleting = !isDeleting;
      if (!isDeleting) {
        phraseIndex = (phraseIndex + 1) % phrases.length;
      }
      setTimeout(typeEffect, 1000); // pause mellem sætninger
    }
  }

  // Start effekten
  typeEffect();
</script>
