require "csv" # CSVファイルを扱うためのライブラリを読み込む
 
puts "1 → 新規でメモを作成する / 2 → 既存のメモに追加する"
  memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換
  if memo_type == 1
    puts "〜ファイル名を入力してください(拡張子除く)〜"
    file_name = gets.chomp #1行のキーボード入力受付
    puts "〜メモの内容を入力し、入力が終わったらEnterを押した後にCtrl + Dを押してください〜"
    memo = STDIN.read #複数行のキーボード入力受付
    CSV.open("#{file_name}.csv","w") do |csv| #新規ファイルを開いて記入
      csv << ["#{memo}".chomp]
      puts "〜保存しました〜"
    end
  
  elsif memo_type == 2
    puts "〜メモを追加したいファイル名を入力してください(拡張子除く)〜"
    file_name = gets.chomp
    CSV.open("#{file_name}.csv","a") do |csv| #既存メモに追記
    end
    
    str = "#{file_name}"
    puts "〜内容を入力し、入力が終わったらEnterを押した後にCtrl + Dを押してください〜"
    memo = STDIN.read
    CSV.open("#{str}.csv","a") do |csv|
      csv << ["#{memo}".chomp]
      puts "〜保存しました〜"
    end
    
  else
    puts "エラー"
  end
  
 