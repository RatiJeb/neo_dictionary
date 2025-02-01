require 'ostruct'

class HomeController < ApplicationController
  def index
    @word = OpenStruct.new(
      {
        word: OpenStruct.new({ id: 1, value: "ზონდერი" }),
        type: OpenStruct.new({ id: 1, value: "არსებ. სახ." }),
        tags: [OpenStruct.new({ id: 1, value: "კიცხვ." })],
        explanations: [
          OpenStruct.new({
                           id: 1,
                           value: "პოლიტიკური ჯგუფის მიერ დაქირავებული ბანდფორმების წევრი, რომელსაც პოლიტიკურ მოწინააღმდეგებზე ანგარიშწორებისთვის იყენებენ;",
                           examples: [
                             OpenStruct.new({
                                              id: 1,
                                              value: "მას სადარბაზოსთან დახვდა პირბადიანი სპორტულად ჩაცმული ზონდერი;"
                                            }),
                             OpenStruct.new({
                                              id: 2,
                                              value: "ზონდერჯგუფები;"
                                            }),
                             OpenStruct.new({
                                              id: 3,
                                              value: "ზონდერბრიგადები;"
                                            }),
                             OpenStruct.new({
                                              id: 4,
                                              value: "ზონდერკრიმინალები;"
                                            }),
                             OpenStruct.new({
                                              id: 5,
                                              value: "ზონდერმკვლელები;"
                                            })
                           ]
                         })
        ],
        etymology: "ნასესხობა გერმანული ენიდან: SS-Sonderkommandos (\"სპეციალური ქვედანაყოფი\"). სიტყვა უკავშირდება მეორე მსოფლიო ომის დროს გერმანელების მიერ შექმნილ სპეციალურ სადამსჯელო რაზმებს."
      })
  end
end
