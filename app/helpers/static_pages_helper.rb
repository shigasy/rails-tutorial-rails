module StaticPagesHelper
  class Word < String
    def palindrome?
      self == reverse
    end
  end
end
