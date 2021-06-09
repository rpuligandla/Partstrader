SEARCH_PAGE_HEADER  =       "//h1[@class='page-heading  product-listing']/span"
PRODUCT_PRICE       =       "//div[@class='right-block']/div/span[@itemprop='price']"
PRODUCT             =       "//div[@class='product-image-container']/div[@class='content_price']/span[@itemprop='price'][text()[contains(normalize-space(.), '~~~')]]/parent::div/parent::div/parent::div/parent::div/parent::li"
PRODUCT_IMAGE       =       "//div[@class='product-image-container']/div[@class='content_price']/span[@itemprop='price'][text()[contains(normalize-space(.), '~~~')]]/parent::div/parent::div/parent::div"
PRODUCT_TITLE       =       "//div[@class='product-image-container']/div[@class='content_price']/span[@itemprop='price'][text()[contains(normalize-space(.), '~~~')]]/parent::div/parent::div/a"
########## FRAME #################
FANCY_BOX_FRAME     =       "//iframe[@class='fancybox-iframe']"
