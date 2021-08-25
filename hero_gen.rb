require 'pixelart'    ## helper library for pixel art images (in .png)

COMPONENTS = {
face: { types: ['', 'myface1','myface2'] },
mouth: {  types: ['', 'mymouth1'] },
eyes: { types: ['', 'myeyes1'] }
}

def generate_hero( codes )
  hero = Pixelart::Image.new( 32, 32 )
           
  COMPONENTS.each_with_index do |(key,part),i|
    code  = codes[i] 
    if code != 0                  
      attribute = part[:types][ code-1 ]
      path = "./components/#{key}/#{key}#{code}.png"
      part = Pixelart::Image.read( path ) 
      hero.compose!( part )
    end
  end                            
  hero                 
end                  

codes = [1, 1, 1]
myhero = generate_hero( codes )
myhero3x = myhero.zoom( 3 )
myhero.save( './hero-0000.png' )
myhero3x.save('./hero-0000x3.png') 
