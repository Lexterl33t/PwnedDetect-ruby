require 'colorize'

require 'open-uri'

require 'json'


class Design 


    def signature()
        apiAscii = open("http://artii.herokuapp.com/make?text=EaquePwnedDetect").read

    end

    def copyright()
        puts "Tools: Pwned Detect".red
        puts "Dev by : Eaque".blue
    end


end

class API

    attr_accessor :email #creation de la variable email dans la cass api

    def initialize(email) #definition d'une function initialize
        @email = email #en gros la variable email juste an haut dans la aattr_accessor c'est le @email et on lui dit que la valeur que l'on va mettre lors de l'instance sera lemail a stocker dans la variable email en haut :)

    end

    def apiRequest #fonction d'nevoie de requete

        apiPwned = open("https://haveibeenpwned.com/api/pasteaccount/#{email}",

        "User-Agent" => "Pwnage-Checker-For-iOS"
        
        
        ).read


    end

    def apiDecompressJson(requests)
        hash = JSON.parse(requests)

    end




end



Designn = Design.new()

puts Designn.signature.yellow
puts ""
Designn.copyright
puts ""
scar = "[+]".red
print "#{scar} Email: "
email = gets.chomp
puts ""


#Creation d'une nouvelle instance
begin
    begin
        api = API.new(email)#la valeur de l'instance sera ce que l'utilisateur va marquer :)

        decompress = api.apiDecompressJson(api.apiRequest)

        decompress.each do |infos|
            puts "////////////////////////////"
            puts "=======Resultat========".blue
            puts "ID: #{infos["Id"]}".green
            puts "Site du post: #{infos["Source"]}".green
            puts "Titre du post: #{infos["Title"]}".green
            puts "Date du post: #{infos["Date"]}".green
            puts "=======================".blue

        end

    rescue OpenURI::HTTPError
        scar1 = "[-]".red
        puts "=======================================".red
        puts "Cette adresse email n'a pas été leak".blue
        puts "=======================================".red


    end

rescue URI::InvalidURIError
    scar1 = "[-]".red
    puts "==================================================".red
    puts "Veuillez saisir un format d'adresse email valide".blue
    puts "==================================================".red

end