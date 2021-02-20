#	plist2map.rb
#	ruby plist2map.rb
#
#	update	2014/03/28


$KCODE = 'u' 

require 'rexml/document'

Dir.glob("./*.plist") {|file|

	if FileTest.directory?(file)==false
		filename = file.gsub(/.*\/(.*).plist/,'\1')
		newfile = filename+".map"
		outf = File.open( newfile ,'w')
		
		outf.puts "# created by plist2map.rb"
		
		doc = REXML::Document.new(open(file))
	
		doc.elements.each('plist/dict') do |element|
		
			1.step(  element.elements.size , 2 ){ |num|
			
				str = element.elements[num+1].text
				next if str.nil?
				outf.print element.elements[num].text + "\t"
				
				a = str.unpack( "U*" )
				sidx=0
				for ch in a do
					if ( sidx>0 ) then
						outf.print ","
					end
					outf.print sprintf("u%04x",ch)
					sidx+=1
				end	
				outf.print "\n"
			}
		end
		outf.close
	end

}
