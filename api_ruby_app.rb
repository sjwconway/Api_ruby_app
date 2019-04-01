require 'httparty'
require 'colorize'
require 'net/http' 
require 'uri'
# repsone.get("https://www.thesportsdb.com/api/v1/json/1/searchteams.php?t=Arsenal")

# class SportsInfoModal
    
# end

# class SportsInfoView
#     def greeting
#         puts "Welcome to the Sports app! Enter a team name!"
#     end

# end


# class SportsInfoController

# end


def sportsInfo

    sportsInfoStatus = true

        while sportsInfoStatus == true

        puts "Welcome to the Football Info App! Please enter a team name from around the world!"
        team = gets.chomp.capitalize.strip


        puts "What information would you like on #{team}?"
    


        config_t = HTTParty.get("https://www.thesportsdb.com/api/v1/json/1/searchteams.php?t=#{team}")
        config_tn = config_t.parsed_response["teams"][0]
        config_p = HTTParty.get("https://www.thesportsdb.com/api/v1/json/1/searchplayers.php?t=#{team}")
        config_pn = "#{config_p.parsed_response["player"][0]["strPlayer"]}" + " Signing Fee: ".blue +  "#{config_p.parsed_response["player"][0]["strSigning"]}" + " position: ".blue + "#{config_p.parsed_response["player"][0]["strPosition"]}",
        "#{config_p.parsed_response["player"][1]["strPlayer"]}" + " Signing Fee: ".blue +  "#{config_p.parsed_response["player"][1]["strSigning"]}" + " position: ".blue + "#{config_p.parsed_response["player"][1]["strPosition"]}",
        "#{config_p.parsed_response["player"][2]["strPlayer"]}" + " Signing Fee: ".blue +  "#{config_p.parsed_response["player"][2]["strSigning"]}" + " position: ".blue + "#{config_p.parsed_response["player"][2]["strPosition"]}",
        "#{config_p.parsed_response["player"][3]["strPlayer"]}" + " Signing Fee: ".blue +  "#{config_p.parsed_response["player"][3]["strSigning"]}" + " position: ".blue + "#{config_p.parsed_response["player"][3]["strPosition"]}",
        "#{config_p.parsed_response["player"][4]["strPlayer"]}" + " Signing Fee: ".blue +  "#{config_p.parsed_response["player"][4]["strSigning"]}" + " position: ".blue + "#{config_p.parsed_response["player"][4]["strPosition"]}",
        "#{config_p.parsed_response["player"][5]["strPlayer"]}" + " Signing Fee: ".blue +  "#{config_p.parsed_response["player"][5]["strSigning"]}" + " position: ".blue + "#{config_p.parsed_response["player"][5]["strPosition"]}",
        "#{config_p.parsed_response["player"][6]["strPlayer"]}" + " Signing Fee: ".blue +  "#{config_p.parsed_response["player"][6]["strSigning"]}" + " position: ".blue + "#{config_p.parsed_response["player"][6]["strPosition"]}",
        "#{config_p.parsed_response["player"][7]["strPlayer"]}" + " Signing Fee: ".blue +  "#{config_p.parsed_response["player"][7]["strSigning"]}" + " position: ".blue + "#{config_p.parsed_response["player"][7]["strPosition"]}",
        "#{config_p.parsed_response["player"][8]["strPlayer"]}" + " Signing Fee: ".blue +  "#{config_p.parsed_response["player"][8]["strSigning"]}" + " position: ".blue + "#{config_p.parsed_response["player"][8]["strPosition"]}",
        "#{config_p.parsed_response["player"][9]["strPlayer"]}" + " Signing Fee: ".blue +  "#{config_p.parsed_response["player"][9]["strSigning"]}" + " position: ".blue + "#{config_p.parsed_response["player"][9]["strPosition"]}",
        "#{config_p.parsed_response["player"][10]["strPlayer"]}" + " Signing Fee: ".blue +  "#{config_p.parsed_response["player"][10]["strSigning"]}" + " position: ".blue + "#{config_p.parsed_response["player"][10]["strPosition"]}",
        "#{config_p.parsed_response["player"][11]["strPlayer"]}" + " Signing Fee: ".blue +  "#{config_p.parsed_response["player"][11]["strSigning"]}" + " position: ".blue + "#{config_p.parsed_response["player"][11]["strPosition"]}",
        "#{config_p.parsed_response["player"][12]["strPlayer"]}" + " Signing Fee: ".blue +  "#{config_p.parsed_response["player"][12]["strSigning"]}" + " position: ".blue + "#{config_p.parsed_response["player"][12]["strPosition"]}",
         config_p.parsed_response["player"].length
        config_sm = "Official Website: ".blue + "#{config_tn["strWebsite"]}",
                    "Facebook: ".blue +  "#{config_tn["strFacebook"]}",
                    "Twitter: ".blue +  "#{config_tn["strTwitter"]}",
                    "Instagram: ".blue +  "#{config_tn["strInstagram"]}"


               


        puts "(1): Year Established / (2): Stadium / (3) Brief Club History / (4): Current League / (5): Players / (6): Social Media"
        choice = gets.chomp.strip.to_s.upcase
   

        if choice == "1"
            puts "Established in #{config_tn["intFormedYear"]}"

        elsif choice == "2"
            puts "(a): Capacity / (b): Decription / (c): Location"
            nestedChoiceS = gets.chomp.downcase.strip

            if  nestedChoiceS == "a"
                puts "Holds #{config_tn["intStadiumCapacity"]}"

            elsif  nestedChoiceS == "b"
                puts config_tn["strStadiumDescription"]

            elsif  nestedChoiceS == "c"
                puts config_tn["strStadiumLocation"]
            
            end

        elsif choice == "3"
            puts config_tn["strDescriptionEN"]

        elsif choice == "4"
            puts "#{team} currently plays in the #{config_tn["strLeague"]}"

        elsif choice == "5"
            puts config_pn

        elsif choice == "6"
            puts config_sm

    
        end

        puts "(1) More info (2) quit"
        exitChoice = gets.chomp.to_s
    
        if exitChoice == "1"
            sportsInfo
    
        elsif exitChoice == "2"
            puts "See you later!"
            sportsInfoStatus = false
            break

        else
            puts "invalid Selection.. Quitting.."
    
        end

    end



end

sportsInfo