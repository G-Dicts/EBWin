#	gaiji2plist.rb
#	ruby -Ks gaiji2plist.rb
#
#	update	2010/01/21

require 'kconv'

class Fixnum
  def utf8chr
    [self].pack('U');
  end
end

$KCONV="utf-8"

  Dir.glob("./*.map") {|file|

  if FileTest.directory?(file)==false
    filename = file.gsub(/.*\/(.*).map/,'\1')
    newfile = filename+".plist"
    outf = File.open( newfile ,'w')

    outf.puts <<EOS
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
EOS

    open(file) {|f|
	f.each {|line|
		line.chop!
		next if line.length==0
		next if line.match(/^#/)
		a = line.split(/\t/)
		next if a.length<2
		next if a[1]=="-"
		if  a[1].match(/null/)
			s_unicode = ""
		else
			s_unicode = ""
			ua = a[1].split(/,/)
			ua.each {|item|
				unicode = item.gsub(/u([0-9a-zA-Z]*)/,'\1')
				s_unicode = s_unicode + (unicode.hex).utf8chr
			}
		end
		if  s_unicode=="&"
			s_unicode="&amp;"
		end
		if  s_unicode=="<"
			s_unicode="&lt;"
		end
		if  s_unicode==">"
			s_unicode="&gt;"
		end
		hex = a[0][0,1]+a[0][1,a[0].length-1].upcase
		if s_unicode.length>0 || a[1].match(/null/)
			outf.puts "<key>"+hex+"</key><string>"+s_unicode+"</string>"
		end
	}
    }

    outf.puts <<EOS
</dict>
</plist>
EOS

    outf.close
  end

}
