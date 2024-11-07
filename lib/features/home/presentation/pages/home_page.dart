import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fake_store_api_ui/theme/presentation/widgets/brightness_selector_widget.dart';
import 'package:fake_store_api_ui/widgets/custom_feature_card.dart';
import 'package:fake_store_api_ui/widgets/custom_feature_description_widget.dart';
import 'package:fake_store_api_ui/widgets/social_network_icon.dart';
import 'package:fake_store_api_ui/widgets/text_code_block_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/tittle_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 300,
        leading: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 32.0),
              child: Icon(
                Icons.stream_outlined,
                size: 36,
              ),
            ),
            SizedBox(width: 8),
            TittleText(
              text: 'Fake Store API',
              size: 32,
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 32.0),
            child: BrightnessSelectorWidget(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildBanner(context),
                const SizedBox(height: 50),
                const TittleText(
                  text: 'There are cases where you need to use an API to get mock some data.',
                  size: 40,
                ),
                const SizedBox(height: 24),
                const TextCodeBlockWidget(
                  text: 'There are some of the salient `features` of the fake store API, which include the following:',
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                buildFeatures(context),
                const SizedBox(height: 70),
                const CustomDivider(),
                const SizedBox(height: 50),
                ...buildExamples(context),
                const SizedBox(height: 70),
                CustomDivider(width: MediaQuery.of(context).size.width - 60),
                const SizedBox(height: 16),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 60,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 32.0),
                                child: Icon(
                                  Icons.stream_outlined,
                                  size: 36,
                                ),
                              ),
                              SizedBox(width: 16),
                              TittleText(
                                text: 'Fake Store API',
                                size: 32,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SocialNetworkIcon(url: 'https://github.com/palmerovicdev'),
                          SizedBox(width: 12),
                          SocialNetworkIcon(url: 'https://www.linkedin.com/in/palmerodev'),
                          SizedBox(width: 12),
                          SocialNetworkIcon(url: 'palmerodev@gmail.com'),
                          SizedBox(width: 12),
                          SocialNetworkIcon(url: 'http://t.me/palmerodev'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Wrap buildFeatures(BuildContext context) {
    var iconSize = 48.0;
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      direction: Axis.horizontal,
      children: [
        FadeInDown(
          delay: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 300),
          child: CustomFeatureCard(
            size: const Size(
              300,
              250,
            ),
            icon: Icon(
              Icons.cable_sharp,
              size: iconSize,
              color: Theme.of(context).colorScheme.primary,
            ),
            name: 'All CRUD Operations',
            description:
                'Full support for all CRUD (Create, Read, Update, Delete) operations on both Product and Category entities within the system.',
          ),
        ),
        FadeInDown(
          delay: const Duration(milliseconds: 300),
          duration: const Duration(milliseconds: 300),
          child: CustomFeatureCard(
            size: const Size(
              300,
              250,
            ),
            icon: Icon(
              Icons.text_snippet,
              size: iconSize,
              color: Theme.of(context).colorScheme.primary,
            ),
            name: 'Pagination Feature',
            description: 'Pagination for both Product and Category entities, allowing for the efficient retrieval of large datasets in smaller, more '
                'manageable chunks.',
          ),
        ),
        FadeInDown(
          delay: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 300),
          child: CustomFeatureCard(
            size: const Size(
              300,
              250,
            ),
            icon: Icon(
              Icons.security,
              size: iconSize,
              color: Theme.of(context).colorScheme.primary,
            ),
            name: 'Auth with JWT',
            description: 'Authentication using JSON Web Tokens (JWT), providing a secure mechanism for verifying the identity of users.',
          ),
        ),
        FadeInDown(
          delay: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 300),
          child: CustomFeatureCard(
            size: const Size(
              300,
              250,
            ),
            icon: Icon(
              Icons.api,
              size: iconSize,
              color: Theme.of(context).colorScheme.primary,
            ),
            name: 'Rest API Feature',
            description: 'REST-ful principles, providing a standardized approach to designing web services that are scalable and '
                'interoperable with other systems.',
          ),
        ),
        FadeInDown(
          delay: const Duration(milliseconds: 600),
          duration: const Duration(milliseconds: 300),
          child: CustomFeatureCard(
            size: const Size(
              300,
              250,
            ),
            icon: Icon(
              Icons.image,
              size: iconSize,
              color: Theme.of(context).colorScheme.primary,
            ),
            name: 'Products Images',
            description: 'Images for each product, allowing front-end developers to display product images.',
          ),
        ),
        FadeInDown(
          delay: const Duration(milliseconds: 700),
          duration: const Duration(milliseconds: 300),
          child: CustomFeatureCard(
            size: const Size(
              300,
              250,
            ),
            icon: Icon(
              Icons.signpost_rounded,
              size: iconSize,
              color: Theme.of(context).colorScheme.primary,
            ),
            name: "Postman and Jetbrains curL",
            description:
                'Postman, Jetbrains curL commands for testing and interacting with the API, enabling developers to explore its capabilities and '
                'functionality.',
          ),
        ),
      ],
    );
  }

  FilledButton buildApiSwaggerButton(BuildContext context) {
    return FilledButton(
      onPressed: () => launchUrlString('http://217.15.171.136:3001/swagger-ui/swagger-ui/index.html'),
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
        ),
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.secondary,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 4.0,
        ),
        child: Text(
          'API',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  FilledButton buildDocsButton() {
    return FilledButton(
      onPressed: () {},
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
        ),
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 4.0,
        ),
        child: Text(
          'Docs',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  buildExamples(BuildContext context) {
    return [
      const TittleText(
        text: 'Examples of curL in Jetbrains IDEs',
        size: 48,
      ),
      const SizedBox(height: 90),
      SizedBox(
        width: 1200,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomFeatureDescriptionWidget(
              smallTittle: 'Get a list of Categories',
              tittle: 'List all the categories',
              description: 'This curL will allow you to list all the categories in the fake store.',
              features: ['List all the categories in database', 'Provide a page and size for implement pagination'],
              maxWidth: 500,
            ),
            const Expanded(child: SizedBox()),
            Material(
              elevation: 8.0,
              borderRadius: BorderRadius.circular(8.0),
              child: const SizedBox(
                width: 590,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
                  child: TextCodeBlockWidget(
                    text: '```'
                        '    '
                        '    ###\n'
                        '    GET http://localhost:8080/category/getAll?\n'
                        '                                        page=0&\n'
                        '                                        size=10&\n'
                        '                                        filter=any,\n'
                        '```',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 70),
      SizedBox(
        width: 1200,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              elevation: 8.0,
              borderRadius: BorderRadius.circular(8.0),
              child: const SizedBox(
                width: 590,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
                  child: TextCodeBlockWidget(
                    text: '```'
                        '    '
                        '    ###\n'
                        '    GET http://localhost:8080/product/get\n'
                        '    Content-Type: application/json\n'
                        '    \n'
                        '    {\n'
                        '       "page": 1,\n'
                        '       "size": 10,\n'
                        '       "filter": "name"\n'
                        '    },\n'
                        '```',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            const CustomFeatureDescriptionWidget(
              smallTittle: 'Get a list of product',
              tittle: 'List all the products',
              description: 'This curL will allow you to list all the products in the fake store.',
              features: ['List all the products in database', 'Provide a page and lot for implement pagination'],
              maxWidth: 500,
            ),
          ],
        ),
      ),
      const SizedBox(height: 70),
      SizedBox(
        width: 1200,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomFeatureDescriptionWidget(
              smallTittle: 'Get a single of product',
              tittle: 'List a product',
              description: 'This curL will allow you to fetch a product from the fake store api.',
              features: [
                'Provide a product',
                'You can select whether to order it based on the id or based on the name',
                'You must provide at least one of the given options',
              ],
              maxWidth: 500,
            ),
            const Expanded(child: SizedBox()),
            Material(
              elevation: 8.0,
              borderRadius: BorderRadius.circular(8.0),
              child: const SizedBox(
                width: 590,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
                  child: TextCodeBlockWidget(
                    text: '```'
                        '    '
                        '    ###\n'
                        '    GET http://localhost:8080/product/get?\n'
                        '                                      id=1&\n'
                        '                                      title=any,\n'
                        '```',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  buildBanner(BuildContext context) {
    return SizedBox(
      height: 480,
      child: Stack(
        children: [
          Image.asset(
            'assets/image-network.jpg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 80),
          Center(
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 64.0,
                fontFamily: 'Horizon',
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TyperAnimatedText(
                    'FOR YOUR FRONT APK',
                    speed: const Duration(milliseconds: 70),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TyperAnimatedText(
                    'MOCK YOUR DATA',
                    speed: const Duration(milliseconds: 70),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TyperAnimatedText(
                    'TEST YOUR FRONT',
                    speed: const Duration(milliseconds: 70),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Positioned(
            bottom: 65,
            left: MediaQuery.of(context).size.width / 2 - 120,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildDocsButton(),
                const SizedBox(width: 24),
                buildApiSwaggerButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.width = 1300,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: Divider(
          thickness: 1,
          endIndent: 0,
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        ),
      ),
    );
  }
}