import 'package:hexacom_user/common/enums/footer_type_enum.dart';
import 'package:hexacom_user/common/models/config_model.dart';
import 'package:hexacom_user/features/support/widgets/support_card_widget.dart';
import 'package:hexacom_user/helper/responsive_helper.dart';
import 'package:hexacom_user/localization/language_constrants.dart';
import 'package:hexacom_user/features/splash/providers/splash_provider.dart';
import 'package:hexacom_user/utill/dimensions.dart';
import 'package:hexacom_user/utill/images.dart';
import 'package:hexacom_user/utill/styles.dart';
import 'package:hexacom_user/common/widgets/custom_app_bar_widget.dart';
import 'package:hexacom_user/common/widgets/custom_shadow_widget.dart';
import 'package:hexacom_user/common/widgets/footer_web_widget.dart';
import 'package:hexacom_user/common/widgets/web_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ConfigModel? configModel = Provider.of<SplashProvider>(context, listen: false).configModel;

    return Scaffold(
      appBar: (ResponsiveHelper.isDesktop(context) ? const PreferredSize(preferredSize: Size.fromHeight(90), child: WebAppBarWidget()) : CustomAppBarWidget(title: getTranslated('help_and_support', context))) as PreferredSizeWidget?,
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Center(child: SizedBox(
          width: Dimensions.webScreenWidth,
          child: CustomShadowWidget(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.isDesktop(context) ? 300 : Dimensions.paddingSizeExtraLarge,
              vertical: ResponsiveHelper.isDesktop(context) ? Dimensions.paddingSizeLarge : 0,
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [

              Align(alignment: Alignment.center, child: SvgPicture.asset(Images.support, height: 300, width: 300)),
              const SizedBox(height: 20),

              Text(getTranslated('need_any_help', context), style: rubikBold.copyWith(
                fontSize: Dimensions.fontSizeExtraLarge,
                fontWeight: FontWeight.w800,
              )),
              const SizedBox(height: Dimensions.paddingSizeDefault),

              Text(
                getTranslated('communicate_with_our_support_team', context),
                style: rubikRegular.copyWith(color: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(0.4)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Dimensions.paddingSizeLarge),

              SupportCardWidget(
                title: "2 ه - ش عبدالعزيز بدر - المعادى 🇪🇬 \n 15 شارع عبدالعزيز عيسي .المنطقة التاسعة.مدينة نصر 🇪🇬 " ,
                icon: Images.branchIcon,
                onTap: (){},
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),

              SupportCardWidget(
                title: "+201091886122",
                icon: Images.callIcon,
                onTap: ()=> launchUrlString('tel:+201091886122', mode: LaunchMode.externalApplication),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),

              SupportCardWidget(
                title: "info@allsafeeg.com",
                icon: Images.messageIcon,
                onTap: () async {
                  await launchUrl(Uri.parse('mailto:"info@allsafeeg.com'), mode: LaunchMode.externalApplication);

                },
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
            ]),
          ),
        ))),

        const FooterWebWidget(footerType: FooterType.sliver),


      ]),
    );
  }
}

