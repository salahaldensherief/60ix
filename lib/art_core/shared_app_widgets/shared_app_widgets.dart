import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sixty_ix/modules/art_core/app_shimmer/posts_shimmer_helper.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:sixty_ix/modules/art_core/custom_pagination/pagination_sliver_list.dart';
import 'package:sixty_ix/modules/art_core/extensions/date_extention.dart';
import 'package:sixty_ix/modules/art_core/shared_app_widgets/favorite_button/comment_favourite_style.dart';
import 'package:sixty_ix/modules/community/presentation/report_post/report_bottom_sheet.dart';
import 'package:sixty_ix/modules/core/constants/app_config.dart';
import 'package:sixty_ix/modules/shared/data/cubits/favourites/favourites_state.dart';
import 'package:sixty_ix/modules/shared/data/cubits/favourites/favourits_cubit.dart';
import 'package:sixty_ix/modules/shared/data/enums/enums.dart';
import 'package:sixty_ix/modules/shared/data/models/community/comment_model.dart';
import 'package:sixty_ix/modules/shared/data/models/services/services_list_params.dart';
import '../../community/presentation/community/community_cubit.dart';
import '../../community/presentation/delete_post/delete_post_dialog.dart';
import '../../community/presentation/post_details/post_details_cubit.dart';
import '../../core/cache/preference_manager.dart';
import '../../core/deep_link_handler.dart';
import '../../core/enums/reportable_type.dart';
import '../../core/router/navigator_keys.dart';
import '../../core/translate/translate.dart';
import '../../shared/data/models/models.dart';
import '../app_shimmer/app_shimmer.dart';
import '../custom_pagination/paginated_sliver_grid.dart';
import '../custom_pagination/pagination_cubit.dart';
import '../custom_pagination/pagination_list_view.dart';
import '../request_ui/request_ui_helper.dart';
import '../resources/app_styles.dart';
import '../resources/fonts_manager.dart';
import 'communities/community_options_bottom_sheet_content.dart';
import 'favorite_button/base_favourite_style.dart';
import 'favorite_button/default_favourite_style.dart';
import 'favorite_button/post_favourite_style.dart';

// blog card
// part 'blog_card/blog_card.dart';

// Section Details
part 'details/section_details.dart';

// Even Card
part 'even_card/even_horizontal_card.dart';

// Favorite Button
part 'favorite_button/favorite_button.dart';

// Filter
part 'filter/filter_card.dart';
part 'filter/filter_footer.dart';
part 'filter/toggle_ratings.dart';
part 'filter/toggle_sort_price.dart';
part 'filter/toggle_distance.dart';

// Product Card
// part 'product_card/product_card.dart';

// reviews card
part 'reviews_card/reviews_card.dart';
part 'reviews_card/reviews_list_pagination.dart';

// Section Card
part 'service_card/service_card.dart';
part 'service_card/services_grid_view.dart';
part 'service_card/services_list_horizontal.dart';
part 'service_card/services_list_pagination.dart';

// Vendor Card
part 'vendor_card/vendor_card.dart';
part 'vendor_card/vendors_list.dart';
part 'vendor_card/vendors_list_pagination.dart';

// Category Card
part 'category_card/category_card.dart';

// Rates
part 'rates/rating_bar.dart';
part 'rates/rates.dart';

part 'communities/post_community_card.dart';
part 'communities/comment_card.dart';
part 'communities/posts_list_pagination.dart';
part 'communities/posts_list.dart';
part 'communities/comments_list_pagination.dart';

// App Logo

part 'app_logo/app_logo.dart';

// Location Info
part 'location/location_on_map_widget.dart';

part 'location/location_info.dart';

// Discount Card
part 'discount_card/discount_card.dart';