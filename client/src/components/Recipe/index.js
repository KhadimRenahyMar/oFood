import './styles.scss';
import { useLocation } from 'react-router-dom';
import sanitizeHtml from 'sanitize-html';

export default function Recipe() {
  const location = useLocation();
  const data = location.state;
  const { recipe } = data;
  // console.log(recipe);
  const steps = sanitizeHtml(recipe.steps_desc);
  const ingredients = sanitizeHtml(recipe.ingredient_desc);
  const intolerances = sanitizeHtml(recipe.intolerances);
  console.log(steps);
  console.log(ingredients);
  console.log("Les intolerances :", recipe);

  return (
    <div className="recipe">
      <div className="recipe__imgBx">

        {/* <img src={`${recipe.photo_link}.png`} className="recipe__img" alt="" /> */}
        
        <img src={recipe.photo_link} className="recipe__img"></img>
        <em className="recipe__time">{recipe.meal_time} minutes</em> {/* //test */}
        <div>
          <h2 className="recipe__title">{recipe.name}</h2> {/* //test */}

          <p className="recipe__desc">Encore une bonne recette facile à préparer ? Merci oFood !</p> {/* //test */}
        </div>
        

      </div>

      <div className="recipe__contentBx"> {/* //test */}
        <div className="recipe__steps" dangerouslySetInnerHTML={{ __html: steps }} />
        <div className="recipe__ingredients" dangerouslySetInnerHTML={{ __html: ingredients }} />
      </div>
    </div>
  );
}
