
needs 'Barcodes/BarcodeKeys'

module BarcodeHelper
  include BarcodeKeys
  
    #instructions to use barcode reader, to get new barcode ids
    #Should return an array of barcode numbers.
    def show_scan_new_items
      Array.new(40, generate_barcode)
    end

    # sets the barcode id of an item
    def set_barcode_id(item:, barcode:)
      item.associate(BARCODE_ID, barcode)
    end

    def get_barcode_id(item)
      item.get(BARCODE_ID)
    end

    # Instructions to retrive a barcoded item and validate
    # with scanner
    def show_retrieve_barcode_items(items:)
      show do 
        title 'Get and scan items'
        note 'Instructions to go get items and scan them to make sure they are the right item'
      end
      return items
    end

    # instructions to take a barcoded item and confirm id
    #
    def scan_to_check_id(item)
      5.times do 
        show do
          title 'Take Item'
          note "Take item #{get_barcode_id(item)}"
          note 'Scan item'
        end
        return true if true #TODO make actually work if scan is correct then true
      end
    end

    # Adds random barcode ot an item
    def add_random_barcode_id(item)
      set_barcode_id(item: item, barcode: generate_barcode)
    end

    def generate_barcode
      rand(2000)
    end

end