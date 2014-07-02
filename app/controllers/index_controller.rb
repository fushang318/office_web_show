class IndexController < ApplicationController
  def meta
    p "~~~~~~~meta~~~~~~~begin~~"
    p params
    p "~~~~~~~meta~~~~~~~end~~~~"

    file_path = Rails.root.join("public/demo.doc")
    render :json => {
      "BaseFileName" => "demo.doc",
      "OwnerId"      => "1", 
      "Size"         => File.size(file_path),
      "SHA256"       => sha256(file_path), 
      "Version"      => sha256(file_path)
    }
  end

  def contents
    p "~~~~~~~contents~~~~~~~begin~~"
    p params
    p "~~~~~~~contents~~~~~~~end~~~~"
    file_path = Rails.root.join("public/demo.doc")
    send_file file_path
  end

  def sha256(file_path)
    require 'digest'
    return Digest::SHA256.file(file_path).hexdigest
  end
end
