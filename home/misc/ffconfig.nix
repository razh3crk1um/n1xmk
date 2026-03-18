{dna, ...}: {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [dna.font.family];
      sansSerif = [dna.font.family];
      monospace = [dna.font.family];
    };
  };
}
