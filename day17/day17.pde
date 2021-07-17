// Portraits, day 17, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

PImage img;
String txt = "Augusta Ada King, Countess of Lovelace (née Byron; 10 December 1815 – 27 November 1852) was an English mathematician and writer, chiefly known for her work on Charles Babbage's proposed mechanical general-purpose computer, the Analytical Engine. She was the first to recognise that the machine had applications beyond pure calculation, and to have published the first algorithm intended to be carried out by such a machine. As a result, she is often regarded as the first computer programmer. Ada Byron was the only child of poet Lord Byron and Lady Byron. All of Byron's other children were born out of wedlock to other women. Byron separated from his wife a month after Ada was born and left England forever four months later. He commemorated the parting in a poem that begins, \"Is thy face like thy mother's my fair child! ADA! sole daughter of my house and heart?\". He died in Greece when Ada was eight years old. Her mother remained bitter and promoted Ada's interest in mathematics and logic in an effort to prevent her from developing her father's perceived insanity. Despite this, Ada remained interested in him, naming her two sons Byron and Gordon. Upon her eventual death, she was buried next to him at her request. Although often ill in her childhood, Ada pursued her studies assiduously. She married William King in 1835. King was made Earl of Lovelace in 1838, Ada thereby becoming Countess of Lovelace. Her educational and social exploits brought her into contact with scientists such as Andrew Crosse, Charles Babbage, Sir David Brewster, Charles Wheatstone, Michael Faraday and the author Charles Dickens, contacts which she used to further her education. Ada described her approach as \"poetical science\" and herself as an \"Analyst (& Metaphysician)\". When she was a teenager, her mathematical talents led her to a long working relationship and friendship with fellow British mathematician Charles Babbage, who is known as \"the father of computers\". She was in particular interested in Babbage's work on the Analytical Engine. Lovelace first met him in June 1833, through their mutual friend, and her private tutor, Mary Somerville. Between 1842 and 1843, Ada translated an article by Italian military engineer Luigi Menabrea on the calculating engine, supplementing it with an elaborate set of notes, simply called \"Notes\". Lovelace's notes are important in the early history of computers, containing what many consider to be the first computer program—that is, an algorithm designed to be carried out by a machine. Other historians reject this perspective and point out that Babbage's personal notes from the years 1836/1837 contain the first programs for the engine. She also developed a vision of the capability of computers to go beyond mere calculating or number-crunching, while many others, including Babbage himself, focused only on those capabilities. Her mindset of \"poetical science\" led her to ask questions about the Analytical Engine (as shown in her notes) examining how individuals and society relate to technology as a collaborative tool. She died of uterine cancer in 1852 at the age of 36.";
// from Wikipedia (https://en.wikipedia.org/wiki/Ada_Lovelace)

void setup() {
  size(512, 512);
  img = loadImage("../ada.jpg");
  noLoop();
  noStroke();
  PFont mono = createFont("Lucida Console", 12);
  textFont(mono);
  textAlign(LEFT, TOP);
}

void draw() {
  background(0);
  
  float w = textWidth("a");
  float w_margin = (width%w)/2;
  float h = 11.2;
  float h_margin = (height%h)/2;
  float bright = 32;
  int i = 0;
  for (float y = h_margin; y < height-h_margin; y += h) {
    for (float x = w_margin; x < width-w_margin; x += w) {
      color col = img.get(int(x+w/2.), int(y+h/2.));
      fill(red(col)+bright, green(col)+bright, blue(col)+bright);
      try {
        text(txt.charAt(i++), x, y);
      } catch (Exception e) {
        
      }
    }
  }
  
  save("result17.jpg");
}
