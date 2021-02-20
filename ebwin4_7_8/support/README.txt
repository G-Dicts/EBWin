サポートファイル

●YRRS-006変換ツール

・最初期の電子ブックSONY DATA-Diskman DD-1に付属のEB( YRRS-006 )は、STARTが書籍構成要素毎に分割されています。
・当ツールは、YRRS-006の個別ファイルを連結して、通常のEB/EBXAと同様の単一のSTARTファイルに変換します。 

	>> YRRS-006.zip

●初期EPWING Toolkit

・初期のEPWING辞書を、通常のEPWING V1フォーマットに変換します。

『広辞苑第三版』岩波書店			発売：富士通	B289CD01
『角川類語新辞典』角川書店			発売：富士通	B289CD03
『現代用語の基礎知識1990年版』自由国民社	発売：富士通	B289CD06
『平凡社世界大百科事典』NEC版

	>> preepwtk101.zip

●EBPocket外字キット

・EBStudio用外字定義ファイル(GaijiMap.xml)、およびコトノコ用外字定義ファイルから、 EBPocket/EBWin用外字定義ファイルに変換するperlスクリプトです。 
・コトノコ用外字定義で2字以上のUnicode列を定義している場合、最初の1字のみが変換されます。またWindowsのフォント環境によって、全てのUNICODEが表示できないことがあります。 

	>> gaijikit.zip 


●EBPocket for iOS 用外字定義変換ツール

(1) EBWin形式 -> EBPocket for iOS/EBMac形式

	>> gaiji2plist.rb

EBWin 用の外字定義ファイル(*.map)から、EBPocket for iOS のplist形式に変換するrubyスクリプトです。

1)Rubyをインストールしてください。 
2)EBWin用の外字定義ファイル(*.map)が存在するディレクトリに、gaiji2plist.rbをコピーしてください。 
3)gaiji2plist.rb をダブルクリックで実行してください。
もしくは、コマンド行から 
ruby -Ks gaiji2plist.rb

で実行してください。 


(2) EBPocket for iOS/EBMac形式 -> EBWin形式

	>> plist2map.rb

EBPocket for iOS のplist形式から、EBWin 用の外字定義ファイル(*.map)に変換するrubyスクリプトです。

1)Rubyをインストールしてください。 
2)*.plist が存在するディレクトリに、plist2map.rbをコピーしてください。 
3) ruby plist2map.rb
で実行してください。 


● 『新潮文学倶楽部』用のCATALOGSファイル

・ファイル名をCATALOGS.LITからCATALOGSに変更してお使いください。

	>> CATALOGS.LIT

●FontDump - EBStudio用外字作成ユーティリティ

	>> fontdump104.zip

●電子ブック漢字インデクサ
・電子ブックに漢字表記インデックスを追加します。

	>> ebkix104a.exe

●EBDump - EPWING / 電子ブック形式の電子辞書の構造解析ツール

	>> ebdmp128.exe


●ユーザ辞書作成・検索ライブラリ ruby版
	>> EBMaker-ruby.zip
