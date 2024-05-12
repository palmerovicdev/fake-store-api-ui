import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fake_store_api_ui/theme/presentation/widgets/brightness_selector_widget.dart';
import 'package:fake_store_api_ui/widgets/custom_feature_card.dart';
import 'package:fake_store_api_ui/widgets/custom_feature_description_widget.dart';
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
        leading: const Padding(
          padding: EdgeInsets.only(left: 32.0),
          child: Icon(
            Icons.stream_outlined,
            size: 32,
          ),
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
                Stack(
                  children: [
                    Image.asset(
                      'assets/image-network.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: 380,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Center(
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 80.0,
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
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Positioned(
                      bottom: 24,
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
                Center(
                  child: SizedBox(
                    width: 1300,
                    child: Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 0,
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
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
                        smallTittle: 'Get a list of product',
                        tittle: 'List all the products',
                        description: 'This curL will allow you to list all the products in the fake store.',
                        features: ['List all the products in database', 'Provide a page and lot for implement pagination'],
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
                        smallTittle: 'Get a list of product',
                        tittle: 'List all the products',
                        description: 'This curL will allow you to list all the products in the fake store.',
                        features: ['List all the products in database', 'Provide a page and lot for implement pagination'],
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
                    ],
                  ),
                ),
                const SizedBox(height: 70),
                Center(
                  child: SizedBox(
                    width: 1300,
                    child: Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 0,
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Wrap buildFeatures(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      direction: Axis.horizontal,
      children: [
        CustomFeatureCard(
          size: const Size(
            300,
            250,
          ),
          icon: Icon(
            Icons.cable_sharp,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
          name: 'All CRUD Operations',
          description: 'Full support for all CRUD (Create, Read, Update, Delete) operations on both Product and Category entities within the system.',
        ),
        CustomFeatureCard(
          size: const Size(
            300,
            250,
          ),
          icon: Icon(
            Icons.text_snippet,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
          name: 'Pagination Feature',
          description: 'Pagination for both Product and Category entities, allowing for the efficient retrieval of large datasets in smaller, more '
              'manageable chunks.',
        ),
        CustomFeatureCard(
          size: const Size(
            300,
            250,
          ),
          icon: Icon(
            Icons.security,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
          name: 'Auth with JWT',
          description: 'Authentication using JSON Web Tokens (JWT), providing a secure mechanism for verifying the identity of users.',
        ),
        CustomFeatureCard(
          size: const Size(
            300,
            250,
          ),
          icon: Icon(
            Icons.api,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
          name: 'Rest API Feature',
          description: 'REST-ful principles, providing a standardized approach to designing web services that are scalable and '
              'interoperable with other systems.',
        ),
        CustomFeatureCard(
          size: const Size(
            300,
            250,
          ),
          icon: Icon(
            Icons.image,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
          name: 'Products Images',
          description: 'Images for each product, allowing front-end developers to display product images.',
        ),
        CustomFeatureCard(
          size: const Size(
            300,
            250,
          ),
          icon: Icon(
            Icons.signpost_rounded,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
          name: "Postman and Jetbrains curL",
          description:
              'Postman, Jetbrains curL commands for testing and interacting with the API, enabling developers to explore its capabilities and '
              'functionality.',
        ),
      ],
    );
  }

  FilledButton buildApiSwaggerButton(BuildContext context) {
    return FilledButton(
      onPressed: () => launchUrlString('http://217.15.171.136:3001/swagger-ui/swagger-ui/index.html'),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
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
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
        ),
        shape: MaterialStateProperty.all(
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
}