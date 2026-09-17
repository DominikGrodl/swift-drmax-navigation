import Foundation

struct Article {
    let authorName: String
    let source: String
    let authorHeadshotUrl: String
    let title: String
    let sections: [Section]
    
    struct Section  {
        let title: String
        let text: String
    }
}

extension Array<Article> {
    static let mock: [Article] = [
        
        // MARK: - Amelia Hart — The Morning Post
        
        Article(
            authorName: "Amelia Hart",
            source: "The Morning Post",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=47",
            title: "The small coastal town quietly becoming a model for greener living",
            sections: [
                Article.Section(
                    title: "A community-led change",
                    text: "Residents of Seaborough have spent the past three years transforming unused spaces into community gardens, wildlife areas and pedestrian-friendly streets."
                ),
                Article.Section(
                    title: "Greener streets",
                    text: "More than 2,000 new trees have been planted across the town, while a network of safe cycling routes has encouraged thousands of journeys to be made without a car."
                ),
                Article.Section(
                    title: "A blueprint for others",
                    text: "Local organisers hope the project will inspire other communities to experiment with practical, locally led environmental improvements."
                )
            ]
        ),
        
        Article(
            authorName: "Amelia Hart",
            source: "The Morning Post",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=47",
            title: "How a group of neighbours turned an empty shop into a thriving community hub",
            sections: [
                Article.Section(
                    title: "A building with a new purpose",
                    text: "When the old corner shop stood empty, residents decided to work together to give the building a new lease of life."
                ),
                Article.Section(
                    title: "Something for everyone",
                    text: "The new community hub now hosts book clubs, repair workshops, language classes and free activities for local children."
                ),
                Article.Section(
                    title: "Growing support",
                    text: "Hundreds of residents have already volunteered their time, with organisers planning to expand the programme over the coming year."
                )
            ]
        ),
        
        Article(
            authorName: "Amelia Hart",
            source: "The Morning Post",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=47",
            title: "Local library sees record turnout after introducing a new generation of events",
            sections: [
                Article.Section(
                    title: "A fresh approach",
                    text: "The Riverside Library has attracted a new audience by combining its traditional services with evening talks, creative workshops and technology classes."
                ),
                Article.Section(
                    title: "Bringing people together",
                    text: "The library now welcomes hundreds of visitors each week, many of whom say the events have helped them meet people in their neighbourhood."
                ),
                Article.Section(
                    title: "Looking ahead",
                    text: "Staff are now planning a larger programme of activities for the summer."
                )
            ]
        ),
        
        // MARK: - Oliver Bennett — The Morning Post
        
        Article(
            authorName: "Oliver Bennett",
            source: "The Morning Post",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=12",
            title: "Young engineers build affordable technology to help farmers save water",
            sections: [
                Article.Section(
                    title: "A practical idea",
                    text: "A team of university graduates has developed a low-cost sensor system that helps farmers understand exactly when their crops need water."
                ),
                Article.Section(
                    title: "Early results",
                    text: "Trials on several farms have shown promising reductions in water use while maintaining healthy crop yields."
                ),
                Article.Section(
                    title: "Taking it further",
                    text: "The team plans to make the technology available to smaller farms that traditionally have had limited access to precision agriculture tools."
                )
            ]
        ),
        
        Article(
            authorName: "Oliver Bennett",
            source: "The Morning Post",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=12",
            title: "Britain's oldest railway station gets a remarkable new beginning",
            sections: [
                Article.Section(
                    title: "Restoring a landmark",
                    text: "A historic railway station that had fallen into disuse has reopened following a major community-backed restoration project."
                ),
                Article.Section(
                    title: "More than a station",
                    text: "The restored building now includes independent shops, workspaces and a café alongside its railway facilities."
                ),
                Article.Section(
                    title: "A boost for the area",
                    text: "Local businesses say the reopening has already brought new visitors and energy to the surrounding neighbourhood."
                )
            ]
        ),
        
        Article(
            authorName: "Oliver Bennett",
            source: "The Morning Post",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=12",
            title: "The school where students are learning by growing their own food",
            sections: [
                Article.Section(
                    title: "Learning outside the classroom",
                    text: "Students at Greenfield Academy spend part of each week working in a large school garden where they grow vegetables, herbs and fruit."
                ),
                Article.Section(
                    title: "Lessons with a difference",
                    text: "Teachers use the garden to introduce lessons in biology, mathematics, nutrition and environmental science."
                ),
                Article.Section(
                    title: "Sharing the harvest",
                    text: "Much of the produce is donated to a local food project, giving students an opportunity to see the wider impact of their work."
                )
            ]
        ),
        
        // MARK: - Sophie Clarke — The Morning Post
        
        Article(
            authorName: "Sophie Clarke",
            source: "The Morning Post",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=32",
            title: "A new generation of volunteers is giving Britain's parks a helping hand",
            sections: [
                Article.Section(
                    title: "Weekend volunteers",
                    text: "Thousands of people have signed up for a new programme encouraging volunteers to help maintain parks and green spaces."
                ),
                Article.Section(
                    title: "A shared effort",
                    text: "Volunteers have planted native flowers, repaired paths and created new habitats for birds and insects."
                ),
                Article.Section(
                    title: "More than maintenance",
                    text: "Organisers say the programme is also helping people build friendships and develop practical outdoor skills."
                )
            ]
        ),
        
        Article(
            authorName: "Sophie Clarke",
            source: "The Morning Post",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=32",
            title: "Independent bookshops find new ways to bring readers together",
            sections: [
                Article.Section(
                    title: "A social space",
                    text: "Independent bookshops across the country are experimenting with reading groups, author evenings and community events."
                ),
                Article.Section(
                    title: "A growing audience",
                    text: "Owners say the events have introduced new readers to their shops and helped strengthen relationships with existing customers."
                ),
                Article.Section(
                    title: "Keeping the conversation going",
                    text: "Many of the participating shops are now planning regular programmes rather than one-off events."
                )
            ]
        ),
        
        Article(
            authorName: "Sophie Clarke",
            source: "The Morning Post",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=32",
            title: "The free music programme giving thousands of children a chance to play",
            sections: [
                Article.Section(
                    title: "Music for everyone",
                    text: "A charitable programme has provided free musical instruments and lessons to children who might otherwise struggle to access music education."
                ),
                Article.Section(
                    title: "Finding confidence",
                    text: "Teachers say many students become more confident as they learn to perform alongside their classmates."
                ),
                Article.Section(
                    title: "A growing programme",
                    text: "The organisation now works with schools across the country and hopes to reach thousands more children."
                )
            ]
        ),
        
        // MARK: - Daniel Brooks — The Daily Chronicle
        
        Article(
            authorName: "Daniel Brooks",
            source: "The Daily Chronicle",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=11",
            title: "The remarkable comeback of Britain's urban wildlife",
            sections: [
                Article.Section(
                    title: "Nature returns",
                    text: "Wildlife experts have recorded encouraging increases in several species across Britain's towns and cities."
                ),
                Article.Section(
                    title: "Small changes matter",
                    text: "Wildflower planting, greener gardens and new ponds have created valuable habitats for insects, birds and amphibians."
                ),
                Article.Section(
                    title: "A long-term effort",
                    text: "Conservation groups say continued support from residents could help these populations become increasingly resilient."
                )
            ]
        ),
        
        Article(
            authorName: "Daniel Brooks",
            source: "The Daily Chronicle",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=11",
            title: "Community football club celebrates its biggest season yet",
            sections: [
                Article.Section(
                    title: "A season to remember",
                    text: "The Riverside Rovers have welcomed hundreds of new young players during a season that has transformed the club."
                ),
                Article.Section(
                    title: "More than football",
                    text: "Alongside training, the club provides mentoring, homework sessions and opportunities for families to get involved."
                ),
                Article.Section(
                    title: "Building for the future",
                    text: "The club is now raising funds for new pitches and equipment to accommodate growing demand."
                )
            ]
        ),
        
        Article(
            authorName: "Daniel Brooks",
            source: "The Daily Chronicle",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=11",
            title: "Scientists discover a surprisingly simple way to make buildings more energy efficient",
            sections: [
                Article.Section(
                    title: "A simple solution",
                    text: "Researchers have found that relatively inexpensive improvements to insulation and ventilation can significantly improve energy efficiency in older buildings."
                ),
                Article.Section(
                    title: "Testing the approach",
                    text: "Pilot projects have demonstrated lower energy consumption while making buildings more comfortable throughout the year."
                ),
                Article.Section(
                    title: "Potential benefits",
                    text: "Researchers believe the approach could be particularly useful for schools, community centres and older homes."
                )
            ]
        ),
        
        // MARK: - Priya Shah — The Daily Chronicle
        
        Article(
            authorName: "Priya Shah",
            source: "The Daily Chronicle",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=44",
            title: "Hospital volunteers bring thousands of moments of kindness to patients",
            sections: [
                Article.Section(
                    title: "A human connection",
                    text: "A network of hospital volunteers has spent the year helping patients with everything from finding their way around the building to simply having a friendly conversation."
                ),
                Article.Section(
                    title: "A welcome presence",
                    text: "Patients and staff say the volunteers provide an important source of reassurance during what can otherwise be a difficult experience."
                ),
                Article.Section(
                    title: "More people joining",
                    text: "The programme has attracted a steady stream of new volunteers, allowing hospitals to expand the service."
                )
            ]
        ),
        
        Article(
            authorName: "Priya Shah",
            source: "The Daily Chronicle",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=44",
            title: "Small businesses turn empty high streets into places people want to visit",
            sections: [
                Article.Section(
                    title: "A changing high street",
                    text: "Independent businesses are helping breathe new life into previously empty high streets by creating distinctive shops, cafés and creative spaces."
                ),
                Article.Section(
                    title: "Working together",
                    text: "Business owners have formed local groups to organise markets, cultural events and late-opening evenings."
                ),
                Article.Section(
                    title: "A renewed sense of place",
                    text: "Residents say the changes have given their town centres a stronger sense of identity and community."
                )
            ]
        ),
        
        Article(
            authorName: "Priya Shah",
            source: "The Daily Chronicle",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=44",
            title: "Students design an app that helps elderly neighbours stay connected",
            sections: [
                Article.Section(
                    title: "An idea born at school",
                    text: "A group of students created a simple app to help older residents find local activities, request help and stay in touch with their neighbours."
                ),
                Article.Section(
                    title: "Designed with residents",
                    text: "The students worked directly with local residents to make the service easy to understand and accessible."
                ),
                Article.Section(
                    title: "Growing interest",
                    text: "Several nearby communities have expressed interest in adapting the idea for their own neighbourhoods."
                )
            ]
        ),
        
        // MARK: - Marcus Reed — The Daily Chronicle
        
        Article(
            authorName: "Marcus Reed",
            source: "The Daily Chronicle",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=68",
            title: "The village that came together to save its historic cinema",
            sections: [
                Article.Section(
                    title: "A beloved building",
                    text: "Residents of Oakridge launched a community campaign to protect their century-old cinema after it faced an uncertain future."
                ),
                Article.Section(
                    title: "A shared achievement",
                    text: "Hundreds of residents contributed to the campaign, helping secure the funding needed for essential repairs."
                ),
                Article.Section(
                    title: "The next chapter",
                    text: "The cinema is now preparing a new programme of films, live performances and community events."
                )
            ]
        ),
        
        Article(
            authorName: "Marcus Reed",
            source: "The Daily Chronicle",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=68",
            title: "British apprentices are helping transform the future of skilled trades",
            sections: [
                Article.Section(
                    title: "A new generation",
                    text: "Thousands of young people are entering apprenticeships across engineering, construction, manufacturing and digital technology."
                ),
                Article.Section(
                    title: "Learning by doing",
                    text: "Apprentices combine classroom learning with hands-on experience, gaining practical skills while working alongside experienced professionals."
                ),
                Article.Section(
                    title: "Growing opportunities",
                    text: "Employers say apprenticeships are becoming an increasingly important route into long-term careers."
                )
            ]
        ),
        
        Article(
            authorName: "Marcus Reed",
            source: "The Daily Chronicle",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=68",
            title: "How one town made walking to school the new morning routine",
            sections: [
                Article.Section(
                    title: "Walking together",
                    text: "Parents and teachers in Brookdale have created supervised walking groups that allow children to travel to school together."
                ),
                Article.Section(
                    title: "A healthier start",
                    text: "Families involved in the scheme say the walks provide children with exercise and a relaxed start to the school day."
                ),
                Article.Section(
                    title: "A stronger community",
                    text: "The initiative has also helped parents and children meet neighbours they might otherwise never have known."
                )
            ]
        ),
        
        // MARK: - Emily Foster — The Evening Review
        
        Article(
            authorName: "Emily Foster",
            source: "The Evening Review",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=5",
            title: "A new wave of British artists is finding inspiration in everyday life",
            sections: [
                Article.Section(
                    title: "Everyday creativity",
                    text: "A new exhibition is showcasing artists whose work explores ordinary places, routines and encounters."
                ),
                Article.Section(
                    title: "A diverse collection",
                    text: "The exhibition brings together painters, photographers, sculptors and digital artists from across the country."
                ),
                Article.Section(
                    title: "Opening the doors",
                    text: "Organisers have also introduced free workshops to encourage visitors to try making art themselves."
                )
            ]
        ),
        
        Article(
            authorName: "Emily Foster",
            source: "The Evening Review",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=5",
            title: "The community choir proving that anyone can find their voice",
            sections: [
                Article.Section(
                    title: "No auditions required",
                    text: "A community choir has attracted hundreds of singers by creating a welcoming environment where people of all musical abilities can take part."
                ),
                Article.Section(
                    title: "A shared experience",
                    text: "Members say rehearsals have become an important part of their weekly routine and a chance to meet new people."
                ),
                Article.Section(
                    title: "Performing together",
                    text: "The choir is preparing for a series of free concerts in local community spaces."
                )
            ]
        ),
        
        Article(
            authorName: "Emily Foster",
            source: "The Evening Review",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=5",
            title: "Historic gardens reopen after years of careful restoration",
            sections: [
                Article.Section(
                    title: "Back in bloom",
                    text: "The gardens of Westmere Hall have reopened following an extensive restoration project."
                ),
                Article.Section(
                    title: "Preserving history",
                    text: "Gardeners used historical records and archaeological research to recreate several features of the original landscape."
                ),
                Article.Section(
                    title: "A place for everyone",
                    text: "The restored grounds will host exhibitions, educational activities and seasonal community events."
                )
            ]
        ),
        
        // MARK: - Thomas Wilson — The Evening Review
        
        Article(
            authorName: "Thomas Wilson",
            source: "The Evening Review",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=14",
            title: "The café giving surplus food a second life",
            sections: [
                Article.Section(
                    title: "Reducing waste",
                    text: "A neighbourhood café has built its menu around surplus ingredients donated by local shops and farms."
                ),
                Article.Section(
                    title: "A popular idea",
                    text: "The café has quickly become a popular meeting place, with customers attracted by both the food and the mission."
                ),
                Article.Section(
                    title: "More meals, less waste",
                    text: "The team estimates that thousands of meals have been created from ingredients that might otherwise have gone unused."
                )
            ]
        ),
        
        Article(
            authorName: "Thomas Wilson",
            source: "The Evening Review",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=14",
            title: "Britain's repair cafés are proving that broken things can have another life",
            sections: [
                Article.Section(
                    title: "Fix rather than replace",
                    text: "Repair cafés are bringing people together to mend household items ranging from lamps and radios to bicycles and furniture."
                ),
                Article.Section(
                    title: "Sharing skills",
                    text: "Experienced volunteers work alongside visitors, helping them learn practical repair skills."
                ),
                Article.Section(
                    title: "A growing movement",
                    text: "More communities are establishing repair sessions as interest in reducing waste continues to grow."
                )
            ]
        ),
        
        Article(
            authorName: "Thomas Wilson",
            source: "The Evening Review",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=14",
            title: "The tiny theatre creating big opportunities for young performers",
            sections: [
                Article.Section(
                    title: "A local stage",
                    text: "The Lantern Theatre has launched a programme giving young performers opportunities to act, direct, write and work behind the scenes."
                ),
                Article.Section(
                    title: "Learning together",
                    text: "Participants work with professional theatre-makers while developing productions for local audiences."
                ),
                Article.Section(
                    title: "Confidence through creativity",
                    text: "Organisers say the programme is helping young people develop confidence and discover new interests."
                )
            ]
        ),
        
        // MARK: - Grace Morgan — The Evening Review
        
        Article(
            authorName: "Grace Morgan",
            source: "The Evening Review",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=25",
            title: "Britain's walking trails are welcoming more visitors than ever",
            sections: [
                Article.Section(
                    title: "Exploring on foot",
                    text: "Walking groups and local tourism organisations are reporting growing interest in Britain's network of countryside and coastal trails."
                ),
                Article.Section(
                    title: "A boost for local communities",
                    text: "Visitors are supporting cafés, accommodation providers and independent businesses in smaller towns and villages along the routes."
                ),
                Article.Section(
                    title: "New routes opening",
                    text: "Several new trails are being developed to connect communities and make more areas accessible to walkers."
                )
            ]
        ),
        
        Article(
            authorName: "Grace Morgan",
            source: "The Evening Review",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=25",
            title: "Gardeners across the country are creating havens for pollinators",
            sections: [
                Article.Section(
                    title: "Gardens for wildlife",
                    text: "Gardeners are increasingly choosing native plants and leaving parts of their gardens wild to provide food and shelter for pollinating insects."
                ),
                Article.Section(
                    title: "Small spaces count",
                    text: "Experts say even balconies and small urban gardens can provide valuable habitat when planted thoughtfully."
                ),
                Article.Section(
                    title: "A nationwide effort",
                    text: "Community gardening groups are sharing advice and plants, helping the movement spread from town to town."
                )
            ]
        ),
        
        Article(
            authorName: "Grace Morgan",
            source: "The Evening Review",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=25",
            title: "From spare room to successful business: the entrepreneurs building from home",
            sections: [
                Article.Section(
                    title: "Starting small",
                    text: "A new generation of entrepreneurs is building businesses from spare rooms, garages and kitchen tables."
                ),
                Article.Section(
                    title: "Local support",
                    text: "Business networks and shared workspaces are providing advice, mentoring and opportunities for these new companies."
                ),
                Article.Section(
                    title: "Growing ambitions",
                    text: "Several of the businesses featured have already expanded beyond their original home-based operations."
                )
            ]
        ),
        
        // MARK: - Nathan Evans — The Evening Review
        
        Article(
            authorName: "Nathan Evans",
            source: "The Evening Review",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=60",
            title: "The school bus powered by sunshine",
            sections: [
                Article.Section(
                    title: "A cleaner journey",
                    text: "A school has introduced an electric bus supported by solar panels installed on its grounds."
                ),
                Article.Section(
                    title: "Learning from the project",
                    text: "Students are using the project to learn about renewable energy, electricity and sustainable transport."
                ),
                Article.Section(
                    title: "A practical example",
                    text: "Teachers hope the project will encourage students to think creatively about how technology can solve everyday challenges."
                )
            ]
        ),
        
        Article(
            authorName: "Nathan Evans",
            source: "The Evening Review",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=60",
            title: "Retired teachers return to the classroom to help a new generation",
            sections: [
                Article.Section(
                    title: "Back to teaching",
                    text: "A group of retired teachers has volunteered to support schools with reading, mathematics and extracurricular activities."
                ),
                Article.Section(
                    title: "Experience shared",
                    text: "The volunteers bring decades of experience while working alongside current teachers."
                ),
                Article.Section(
                    title: "A two-way relationship",
                    text: "Many volunteers say they have enjoyed discovering new teaching methods and technologies from younger colleagues."
                )
            ]
        ),
        
        Article(
            authorName: "Nathan Evans",
            source: "The Evening Review",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=60",
            title: "A village bakery becomes an unexpected centre of community life",
            sections: [
                Article.Section(
                    title: "More than bread",
                    text: "A family-run bakery has become a gathering place for residents after introducing communal tables and regular local events."
                ),
                Article.Section(
                    title: "A place to meet",
                    text: "Customers now use the space for everything from informal meetings to book clubs and charity fundraisers."
                ),
                Article.Section(
                    title: "Keeping traditions alive",
                    text: "The owners say their aim is to preserve the character of the village while creating something useful for its future."
                )
            ]
        ),
        
        // MARK: - Lily Turner — The Evening Review
        
        Article(
            authorName: "Lily Turner",
            source: "The Evening Review",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=49",
            title: "The science club making discovery accessible to everyone",
            sections: [
                Article.Section(
                    title: "Curiosity after school",
                    text: "A free science club is giving children the opportunity to conduct experiments and explore subjects that interest them."
                ),
                Article.Section(
                    title: "Hands-on learning",
                    text: "Sessions include everything from building simple robots to studying local wildlife."
                ),
                Article.Section(
                    title: "Growing interest",
                    text: "The club has expanded from a handful of students to a waiting list, prompting organisers to recruit more volunteers."
                )
            ]
        ),
        
        Article(
            authorName: "Lily Turner",
            source: "The Evening Review",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=49",
            title: "How a community garden brought five generations together",
            sections: [
                Article.Section(
                    title: "Growing together",
                    text: "A community garden has become a meeting point for residents ranging from young children to people in their nineties."
                ),
                Article.Section(
                    title: "Sharing knowledge",
                    text: "Older gardeners have passed on traditional growing techniques while younger members have introduced new approaches."
                ),
                Article.Section(
                    title: "A harvest to share",
                    text: "The garden's produce is shared among volunteers and donated to local community organisations."
                )
            ]
        ),
        
        Article(
            authorName: "Lily Turner",
            source: "The Evening Review",
            authorHeadshotUrl: "https://i.pravatar.cc/150?img=49",
            title: "Local designers turn discarded materials into beautiful furniture",
            sections: [
                Article.Section(
                    title: "Creative reuse",
                    text: "A collective of designers is creating furniture from reclaimed timber, old fabrics and materials that would otherwise have been discarded."
                ),
                Article.Section(
                    title: "Design with a purpose",
                    text: "Each piece is designed to demonstrate that sustainability and good design can work together."
                ),
                Article.Section(
                    title: "Teaching the next generation",
                    text: "The collective also runs workshops where young people can learn woodworking, design and repair skills."
                )
            ]
        )
    ]
}
