## 2.0.8 (2018-02-23)

 * Support mail 2.7.0
   (Note: This version of mail gem changes the way to handle empty subject.)

## 2.0.7 (2017-04-26)

 * iso-2022-jp should be handled as ISO-2022-JP in unstructured fields (#19) -- shugo

## 2.0.6 (2017-02-20)

 * Support quoted display-name (#18) -- ackintosh
 * Drop support for Ruby 2.1.x

## 2.0.5 (2016-08-01)

 * Support mail 2.6.4

## 2.0.1 (2013-04-14)

 * Do not encode field value if value is ascii only.

## 2.0.0 (2013-01-06)

 * Divide `patches.rb` into separate files.
 * Convert MINUS SIGN (U+2212) and FULLWIDTH HYPHEN MINUS (U+ff0d) to 0x215d.
 * Convert EM DASH (U+2014) and HORIZONTAL BAR (U+2015) to 0x213d.
 * Convert DOUBLE VERTICAL LINE (U+2016) and PARALLEL TO (U+2225) to 0x2142.

## 1.3.0 (2012-12-20)

 * set charset of the text part of multipart mail (#7)

## 1.2.1 (2012-11-25)

 * support `mail` 2.5.2

## 1.2.0 (2012-08-04)

 * replace unconvertable characters with question marks (#5)

## 1.1.8 (2012-06-22)

 * encode the whole subject instead of splitting it with white spaces (#3)

## 1.1.7 (2012-06-13)

 * rescue Encoding::CompatibilityError exception

## 1.1.6 (2012-03-29)

 * support mail 2.4.4
 * move some methods from SubjectField to UnstructuredField in order to fix
   encoding problems that are reported to occur on Windows environment

## 1.1.5 (2012-02-16)

 * support mail 2.4.1

## 1.1.4 (2011-12-07)

* Bug fix: correct the signature of the `encode_with_iso_2022_jp` method

## 1.1.3 (2011-12-06) -- yanked

* handle array values correctly

## 1.1.2 (2011-12-04)

* handle frozen texts correctly

## 1.1.1 (2011-11-21)

* support Rails 3.0.x

## 1.1.0 (2011-11-20)

* keep hankaku kana as is

## 1.0.9 (2011-11-20)

* handle special characters such as `髙` or `﨑` correctly (Body)

## 1.0.8 (2011-11-20)

* handle special characters such as `髙` or `﨑` correctly (Ruby 1.8.7)

## 1.0.7 (2011-11-20)

* handle special characters such as `髙` or `﨑` correctly

## 1.0.6 (2011-11-20)

* Bug fix: wrong logic in the b_value_encode method

## 1.0.5 (2011-11-20)

* try to handle special characters such as `髙` or `﨑`, without success

## 1.0.4 (2011-11-20)

* now, work with Ruby 1.9.x

## 1.0.3 (2011-11-20)

* handle fullwidth tildes and wave dashes correctly

## 1.0.2 (2011-11-19)

* convert `Sender`, `Reply-To`, `Resent-From`, `Resent-Sender`, `Resent-To`, `Resent-Cc` header values

## 1.0.1 (2011-11-19)

* convert `Cc` header value to iso-2022-jp encoding

## 1.0.0 (2011-11-19)

* fork from [ma2shita/mail_ja](https://github.com/ma2shita/mail_ja)
* convert `to` and `from` header values to iso-2022-jp encoding
* first public release as a gem
