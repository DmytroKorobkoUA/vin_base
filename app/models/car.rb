class Car < ApplicationRecord
  require 'open-uri'
  require 'zip'
  require 'csv'
  require 'pry'

  validates :vin, presence: true

  def self.download_zip(url='https://data.gov.ua/dataset/0ffd8b75-0628-48cc-952a-9302f9799ec0/resource/c5cb530d-0533-40be-b9ad-f03e06c94b10/download/tz_opendata_z01012021_po01122021.zip')
    download = URI.parse(url).open
    IO.copy_stream(download, "#{Rails.public_path}/zip/data.zip")
  end

  def self.extract_zip(file, destination)
    FileUtils.mkdir_p(destination)

    Zip::File.open(file) do |zip_file|
      zip_file.each do |f|
        fpath = File.join(destination, f.name)
        zip_file.extract(f, fpath) unless File.exist?(fpath)
      end
    end
  end

  def self.unzip_csv
    extract_zip("#{Rails.public_path}/zip/data.zip", "#{Rails.public_path}/csv")
  end

  def self.update_from_csv(file="#{Rails.public_path}/csv/tz_opendata_z01012021_po01122021.csv")
    cars_data = CSV.read(file, headers: true, col_sep: ';')

    cars_data.each do |car|
      car_in_db = self.find_by(vin: car['VIN'])
      car_in_db.nil? ? create_car_record(car) : update_car_record(car_in_db, car)
    end
  end
  
  def self.create_car_record(car)
    self.create(
      person: car['PERSON'],
      reg_addr_koatuu: car['REG_ADDR_KOATUU'],
      oper_code: car['OPER_CODE'],
      oper_name: car['OPER_NAME'],
      d_reg: car['D_REG'],
      dep_code: car['DEP_CODE'],
      dep: car['DEP'],
      brand: car['BRAND'],
      model: car['MODEL'],
      vin: car['VIN'],
      make_year: car['MAKE_YEAR'],
      color: car['COLOR'],
      kind: car['KIND'],
      body: car['BODY'],
      purpose: car['PURPOSE'],
      fuel: car['FUEL'],
      capacity: car['CAPACITY'],
      own_weight: car['OWN_WEIGHT'],
      total_weight: car['TOTAL_WEIGHT'],
      n_reg_new: car['N_REG_NEW']
    )
  end
  
  def self.update_car_record(car_in_db, car)
    car_in_db.update_attributes(
      person: car['PERSON'],
      reg_addr_koatuu: car['REG_ADDR_KOATUU'],
      oper_code: car['OPER_CODE'],
      oper_name: car['OPER_NAME'],
      d_reg: car['D_REG'],
      dep_code: car['DEP_CODE'],
      dep: car['DEP'],
      brand: car['BRAND'],
      model: car['MODEL'],
      make_year: car['MAKE_YEAR'],
      color: car['COLOR'],
      kind: car['KIND'],
      body: car['BODY'],
      purpose: car['PURPOSE'],
      fuel: car['FUEL'],
      capacity: car['CAPACITY'],
      own_weight: car['OWN_WEIGHT'],
      total_weight: car['TOTAL_WEIGHT'],
      n_reg_new: car['N_REG_NEW']
    )
  end
end
