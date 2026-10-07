# coding: utf-8

require 'mail'

module Mail
  # Encoding for address fields (From, To, Cc, ...). Must be included after
  # FieldWithIso2022JpEncoding, whose token-wise encoding is used as the fallback.
  #
  # A display name that contains non-ASCII characters is encoded as a single
  # encoded-word, so that the quotes and spaces inside it never leak into the raw
  # header and break the address syntax (e.g. '"Taro Yamada 太郎" <taro@example.test>'
  # used to be split into '=?..?=' and raw fragments, and the mail gem could not
  # extract the addr-spec any more).
  module AddressFieldWithIso2022JpEncoding
    private
    def encode_with_iso_2022_jp(value, charset)
      encode_address_list_with_iso_2022_jp(value, charset) || super
    end

    # Returns the encoded address list, or nil if the value cannot be handled as
    # an address list (then the caller falls back to the token-wise encoding).
    def encode_address_list_with_iso_2022_jp(value, charset)
      return nil unless value.kind_of?(String) && !value.ascii_only?

      addresses = Mail::AddressList.new(value).addresses
      return nil if addresses.empty? || addresses.any? { |a| a.address.nil? }

      addresses.map { |a| encode_address_with_iso_2022_jp(a, charset) }.join(', ').force_encoding('ascii-8bit')
    rescue Mail::Field::ParseError
      nil
    end

    def encode_address_with_iso_2022_jp(address, charset)
      name = address.display_name
      return address.address if name.nil? || name.empty?
      return address.to_s if name.ascii_only?

      name = Mail::Preprocessor.process(name)
      name = Mail.encoding_to_charset(name, charset)
      name.force_encoding('ascii-8bit')
      "#{encode64(name)} <#{address.address}>"
    end
  end
end
