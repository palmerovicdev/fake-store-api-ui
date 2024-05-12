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
            width: 1300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const TittleText(
                  text: 'Fake Store API for fronted development',
                ),
                const SizedBox(height: 24),
                const TextCodeBlockWidget(
                  text: 'A storefront API that emulates backend responses featuring \ntwo primary entities: `Product` and '
                      '`Category`',
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildDocsButton(),
                    const SizedBox(width: 24),
                    buildApiSwaggerButton(context),
                  ],
                ),
                const SizedBox(height: 70),
                Image.asset(
                  'assets/image-network.jpg',
                  width: 1300,
                  height: 700,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 100),
                const TittleText(
                  text: 'There are cases where you need to use an API to get mock some data for your front-end application.',
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
                const SizedBox(height: 80),
                buildFeatures(context),
                const SizedBox(height: 70),
                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 0,
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                ),
                const SizedBox(height: 50),
                const TittleText(
                  text: 'Examples of curL in Postman',
                  size: 40,
                ),
                const SizedBox(height: 40),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomFeatureDescriptionWidget(
                      smallTittle: 'Get a list of product',
                      tittle: 'List all the products',
                      description: 'This curL will allow you to list all the products in the fake store.',
                      features: ['List all the products in database', 'Provide a page and lot for implement pagination'],
                    ),
                    TextCodeBlockWidget(
                      text: '',
                    ),
                  ],
                ),
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
          description:
              'The API provides full support for all CRUD (Create, Read, Update, Delete) operations on both Product and Category entities within the system, enabling comprehensive data management capabilities.',
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
          description:
              'The API supports pagination for both Product and Category entities, allowing for the efficient retrieval of large datasets in smaller, more manageable chunks.',
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
          description:
              'The API supports authentication using JSON Web Tokens (JWT), providing a secure mechanism for verifying the identity of users and protecting sensitive data within the system.',
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
          description: 'The API follows REST-ful principles, providing a standardized approach to designing web services that are scalable, '
              'maintainable, and interoperable with other systems.',
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
          description:
              'The API provides images for each product, allowing front-end developers to display product images alongside their respective details and descriptions.',
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
              'The API provides a Postman collection and Jetbrains curL commands for testing and interacting with the API, enabling developers to explore its capabilities and functionality.',
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
            fontSize: 18,
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
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}